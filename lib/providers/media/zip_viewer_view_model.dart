import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/material.dart';

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
    this.children = const [], // Provide default empty list
  });
}

class ZipViewerViewModel extends BaseViewModel {
  final String url;
  bool isLoading = true;
  bool screenTaped = false;
  List<ZipEntry> files = [];

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

        // Create maps to organize files and directories
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

          // Add to files map
          if (!filesByDirectory.containsKey(directoryPath)) {
            filesByDirectory[directoryPath] = [];
          }
          filesByDirectory[directoryPath]!.add(file);

          // Build directory hierarchy by adding all parent directories
          String currentPath = '';
          for (int i = 0; i < parts.length - 1; i++) {
            currentPath =
                currentPath.isEmpty ? parts[i] : '$currentPath/${parts[i]}';
            allDirectories.add(currentPath);
          }
        }

        // Recursive function to build the folder hierarchy
        List<ZipEntry> buildFolderStructure(String currentPath) {
          final List<ZipEntry> entries = [];

          // Add files in the current directory
          if (filesByDirectory.containsKey(currentPath)) {
            for (final file in filesByDirectory[currentPath]!) {
              final List<String> parts = file.name.split('/');
              parts.removeWhere((part) => part.isEmpty);
              final String fileName = parts.last;

              final data = Uint8List.fromList(file.content as List<int>);
              String? preview;
              if (file.name.endsWith('.txt')) {
                preview = String.fromCharCodes(data).trim();
                if (preview.length > 200) {
                  preview = '${preview.substring(0, 200)}...';
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

          // Find all immediate subdirectories of the current path
          final subdirectories = allDirectories.where((dirPath) {
            if (dirPath.isEmpty) {
              return false;
            }

            final List<String> currentPathParts =
                currentPath.isEmpty ? [] : currentPath.split('/');
            final dirPathParts = dirPath.split('/');

            // Check if this directory is a direct child of currentPath
            final bool isDirectChild =
                dirPathParts.length == currentPathParts.length + 1;

            if (currentPath.isEmpty) {
              return isDirectChild && !dirPath.contains('/');
            } else {
              return isDirectChild && dirPath.startsWith('$currentPath/');
            }
          }).toList();

          // For each subdirectory, create a folder entry with its children
          for (final subdirectory in subdirectories) {
            final folderName = subdirectory.split('/').last;

            final folderEntry = ZipEntry(
              name: folderName,
              isFile: false,
              children: buildFolderStructure(subdirectory), // Recursive call
            );

            entries.add(folderEntry);
          }

          return entries;
        }

        // Start building from the root directory (empty path)
        files = buildFolderStructure('');
      }
    } on Exception catch (e) {
      debugPrint('Error loading zip: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void onTapScreen() {
    screenTaped = !screenTaped;
    notifyListeners();
  }

  void openFile(ZipEntry file) {
    if (file.isFile) {
      debugPrint('Open file: ${file.name}');
      // Implement file open logic here
    }
  }
}
