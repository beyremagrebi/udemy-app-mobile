import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/common/study_material.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:flutter/material.dart';

enum FileType {
  image,
  video,
  pdf,
  presentation,
  word,
  excel,
  archive,
  unknown,
}

class StudyMaterialItem extends StatelessWidget {
  final StudyMaterial studyMaterial;
  const StudyMaterialItem({required this.studyMaterial, super.key});

  @override
  Widget build(BuildContext context) {
    final fileName = studyMaterial.displayName ?? intl.error;
    final fileType = _getFileTypeFromExtension(fileName);
    final fileTypeName = _getFileTypeName(fileType);

    return Card(
      elevation: 0,
      child: Padding(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            IconBox(
              icon: _getFileTypeIcon(fileType),
              iconBackgroundColor: const Color(0x20B0BEC5),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _shortenFileName(fileName),
                    style: textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    fileTypeName,
                    style: textTheme.labelSmall?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              _getActionIcon(fileType),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getActionIcon(FileType fileType) {
    switch (fileType) {
      case FileType.image:
        return Icons.visibility_outlined; // Show image
      case FileType.video:
        return Icons.play_arrow_outlined; // Play video
      case FileType.pdf:
        return Icons.open_in_new_outlined; // Open PDF
      case FileType.presentation:
        return Icons.slideshow_outlined; // Start presentation
      case FileType.word:
      case FileType.excel:
        return Icons.open_in_new_outlined; // Open document
      case FileType.archive:
        return Icons.folder_open_outlined; // Open archive
      case FileType.unknown:
      default:
        return Icons.open_in_new_outlined; // Open document
    }
  }

  FileType _getFileTypeFromExtension(String fileName) {
    final extension = fileName.toLowerCase().split('.').last;

    if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg']
        .contains(extension)) {
      return FileType.image;
    } else if (['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm', 'mkv']
        .contains(extension)) {
      return FileType.video;
    } else if (['pdf'].contains(extension)) {
      return FileType.pdf;
    } else if (['ppt', 'pptx'].contains(extension)) {
      return FileType.presentation;
    } else if (['doc', 'docx'].contains(extension)) {
      return FileType.word;
    } else if (['xls', 'xlsx'].contains(extension)) {
      return FileType.excel;
    } else if (['zip', 'rar', '7z', 'tar', 'gz'].contains(extension)) {
      return FileType.archive;
    } else {
      return FileType.unknown;
    }
  }

  IconData _getFileTypeIcon(FileType fileType) {
    switch (fileType) {
      case FileType.image:
        return Icons.image_outlined;
      case FileType.video:
        return Icons.videocam_outlined;
      case FileType.pdf:
        return Icons.picture_as_pdf_outlined;
      case FileType.presentation:
        return Icons.slideshow_outlined;
      case FileType.word:
        return Icons.article_outlined;
      case FileType.excel:
        return Icons.table_chart_outlined;
      case FileType.archive:
        return Icons.archive_outlined;
      case FileType.unknown:
      default:
        return Icons.insert_drive_file_rounded;
    }
  }

  String _getFileTypeName(FileType fileType) {
    switch (fileType) {
      case FileType.image:
        return 'Image';
      case FileType.video:
        return 'Video';
      case FileType.pdf:
        return 'PDF';
      case FileType.presentation:
        return 'Presentation';
      case FileType.word:
        return 'Word Document';
      case FileType.excel:
        return 'Excel Spreadsheet';
      case FileType.archive:
        return 'Archive';
      case FileType.unknown:
      default:
        return 'Document';
    }
  }

  String _shortenFileName(String name, {int maxLength = 25}) {
    if (name.length <= maxLength) {
      return name;
    }

    final dotIndex = name.lastIndexOf('.');
    final extension = dotIndex != -1 ? name.substring(dotIndex) : '';
    var baseName = dotIndex != -1 ? name.substring(0, dotIndex) : name;

    if (baseName.length > maxLength - extension.length) {
      baseName =
          '${baseName.substring(0, (maxLength - extension.length) ~/ 2)}...${baseName.substring(baseName.length - ((maxLength - extension.length) ~/ 2))}';
    }
    return '$baseName$extension';
  }
}
