import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:flutter/material.dart';

class ProfessionalFileItem extends StatelessWidget {
  final String fileName;
  final User? creator;

  final String? fileType;

  final VoidCallback? onTap;
  const ProfessionalFileItem({
    required this.fileName,
    this.creator,
    this.fileType,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: Dimensions.paddingAllxSmall,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // File header with icon and basic info
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: _getFileColor().withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getFileIcon(),
                      color: _getFileColor(),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fileName,
                          style: textTheme.titleSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            if (fileType != null || _getFileType() != '')
                              Text(
                                fileType ?? _getFileType(),
                                style: textTheme.labelSmall,
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getFileColor() {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Colors.red;
      case 'doc':
      case 'docx':
        return Colors.lightBlue;
      case 'xls':
      case 'xlsx':
        return Colors.green;
      case 'ppt':
      case 'pptx':
        return Colors.yellow;
      case 'zip':
      case 'rar':
        return Colors.grey;
      default:
        return Colors.white;
    }
  }

  IconData _getFileIcon() {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf_outlined;
      case 'doc':
      case 'docx':
        return Icons.description_outlined;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart_outlined;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow_outlined;
      case 'txt':
        return Icons.subject_outlined;
      case 'zip':
      case 'rar':
        return Icons.archive_outlined;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Icons.image_outlined;
      case 'mp4':
      case 'avi':
      case 'mov':
        return Icons.videocam_outlined;
      case 'mp3':
      case 'wav':
        return Icons.audiotrack_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }

  String _getFileType() {
    return fileName.split('.').last.toUpperCase();
  }
}
