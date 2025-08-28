import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/utils/snackbar_utils.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../presentation/utils/alert_dialog.dart';

class ZipEntry {
  final String name;
  final bool isFile;
  final Uint8List? data;
  final String? preview;
  final List<ZipEntry> children;

  ZipEntry({
    required this.name,
    required this.isFile,
    this.data,
    this.preview,
    this.children = const [],
  });
}

class ZipViewerViewModel extends BaseViewModel {
  final String url;
  bool isLoading = true;
  bool screenTaped = false;
  List<ZipEntry> files = [];
  ZipEntry? selectedFile;

  ZipViewerViewModel(super.context, {required this.url}) {
    loadZip();
  }

  void closeViewer() {
    Navigator.of(context).pop();
  }

  Future<void> loadZip() async {
    try {
      final dio = Dio();
      final response = await dio.get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200 && response.data != null) {
        final archive = ZipDecoder().decodeBytes(response.data!);

        final Map<String, List<ArchiveFile>> filesByDirectory = {};
        final Set<String> allDirectories = {};

        for (final file in archive) {
          if (!file.isFile) {
            continue;
          }

          final List<String> parts = file.name.split('/');
          parts.removeWhere((part) => part.isEmpty);

          if (parts.isEmpty) {
            continue;
          }

          final String directoryPath = parts.length > 1
              ? parts.sublist(0, parts.length - 1).join('/')
              : '';

          if (!filesByDirectory.containsKey(directoryPath)) {
            filesByDirectory[directoryPath] = [];
          }
          filesByDirectory[directoryPath]!.add(file);

          String currentPath = '';
          for (int i = 0; i < parts.length - 1; i++) {
            currentPath =
                currentPath.isEmpty ? parts[i] : '$currentPath/${parts[i]}';
            allDirectories.add(currentPath);
          }
        }

        List<ZipEntry> buildFolderStructure(String currentPath) {
          final List<ZipEntry> entries = [];

          if (filesByDirectory.containsKey(currentPath)) {
            for (final file in filesByDirectory[currentPath]!) {
              final List<String> parts = file.name.split('/');
              parts.removeWhere((part) => part.isEmpty);
              final String fileName = parts.last;

              final data = Uint8List.fromList(file.content as List<int>);
              String? preview;
              if (file.name.endsWith('.txt') ||
                  file.name.endsWith('.csv') ||
                  file.name.endsWith('.json') ||
                  file.name.endsWith('.xml')) {
                try {
                  preview = String.fromCharCodes(data).trim();
                  if (preview.length > 200) {
                    preview = '${preview.substring(0, 200)}...';
                  }
                } on Exception catch (e) {
                  preview = 'Cannot preview file content :$e';
                }
              }

              entries.add(ZipEntry(
                name: fileName,
                isFile: true,
                data: data,
                preview: preview,
                children: [],
              ));
            }
          }

          final subdirectories = allDirectories.where((dirPath) {
            if (dirPath.isEmpty) {
              return false;
            }

            final List<String> currentPathParts =
                currentPath.isEmpty ? [] : currentPath.split('/');
            final dirPathParts = dirPath.split('/');

            final bool isDirectChild =
                dirPathParts.length == currentPathParts.length + 1;

            if (currentPath.isEmpty) {
              return isDirectChild && !dirPath.contains('/');
            } else {
              return isDirectChild && dirPath.startsWith('$currentPath/');
            }
          }).toList();

          for (final subdirectory in subdirectories) {
            final folderName = subdirectory.split('/').last;

            final folderEntry = ZipEntry(
              name: folderName,
              isFile: false,
              children: buildFolderStructure(subdirectory),
            );

            entries.add(folderEntry);
          }

          return entries;
        }

        files = buildFolderStructure('');
      }
    } on Exception catch (e) {
      debugPrint('Error loading zip: $e');
      if (context.mounted) {
        SnackBarUtils.showError(context, 'Error loading zip file: $e');
      }
    } finally {
      isLoading = false;
      update();
    }
  }

  void onTapScreen() {
    screenTaped = !screenTaped;
    update();
  }

  Future<void> openFile(ZipEntry file) async {
    if (file.isFile && file.data != null) {
      selectedFile = file;
      update();

      try {
        final extension = file.name.split('.').last.toLowerCase();

        switch (extension) {
          case 'txt':
          case 'csv':
          case 'json':
          case 'xml':
          case 'html':
          case 'htm':
            showTextPreview(file);
            break;
          case 'png':
          case 'jpg':
          case 'jpeg':
          case 'gif':
          case 'bmp':
            showImagePreview(file);
            break;
          default:
            await openWithExternalApp(file);
        }
      } on Exception catch (e) {
        debugPrint('Error opening file: $e');
        if (context.mounted) {
          SnackBarUtils.showError(context, 'Cannot open file: ${file.name}');
        }
      }
    }
  }

  Future<void> openWithExternalApp(ZipEntry file) async {
    try {
      if (Platform.isAndroid) {
        final status = await Permission.storage.status;
        if (!status.isGranted) {
          final result = await Permission.storage.request();
          if (!result.isGranted) {
            if (context.mounted) {
              SnackBarUtils.showError(context, 'Storage permission denied');
            }
            return;
          }
        }
      }

      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/${file.name}';

      final File tempFile = File(filePath);
      await tempFile.writeAsBytes(file.data!);

      final result = await OpenFile.open(filePath);

      if (result.type != ResultType.done) {
        if (context.mounted) {
          SnackBarUtils.showError(
              context, 'Cannot open file: ${result.message}');
        }
      }
    } on Exception catch (e) {
      debugPrint('Error opening with external app: $e');
      if (context.mounted) {
        SnackBarUtils.showError(context, 'Error opening file: $e');
      }
    }
  }

  void showImagePreview(ZipEntry file) {
    if (file.data != null) {
      CustomAlertDialog.build(
        context: context,
        title: file.name,
        primaryButtonText: 'Open Externally',
        content: Expanded(
          child: InteractiveViewer(
            child: Image.memory(
              file.data!,
              fit: BoxFit.none,
            ),
          ),
        ),
        onPrimaryPressed: () {
          Navigator.of(context).pop(); // Close the dialog first
          openWithExternalApp(file);
        },
        secondaryButtonText: intl.closeButton,
        onSecondaryPressed: () => Navigator.of(context).pop(),
      );
    }
  }

  void showTextPreview(ZipEntry file) {
    if (file.data != null) {
      try {
        final content = String.fromCharCodes(file.data!);

        CustomAlertDialog.build(
          context: context,
          title: file.name,
          primaryButtonText: 'Open Externally',
          content: Expanded(
            child: SingleChildScrollView(
                child: Theme(
              data: Theme.of(context).copyWith(
                textSelectionTheme: const TextSelectionThemeData(
                  cursorColor: Colors.white,
                  selectionColor: Colors.white24, // highlight color
                  selectionHandleColor: Colors.white,
                ),
              ),
              child: SelectableText(
                content,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: Colors.white,
                ),
              ),
            )),
          ),
          onPrimaryPressed: () {
            Navigator.of(context).pop();
            openWithExternalApp(file);
          },
          secondaryButtonText: intl.closeButton,
          onSecondaryPressed: () => Navigator.of(context).pop(),
        );
      } on Exception {
        SnackBarUtils.showError(context, 'Cannot read text file: ${file.name}');
      }
    }
  }
}
