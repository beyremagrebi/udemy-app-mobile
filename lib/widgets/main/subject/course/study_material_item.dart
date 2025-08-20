import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/common/study_material.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:flutter/material.dart';

class StudyMaterialItem extends StatelessWidget {
  final StudyMaterial studyMaterial;
  const StudyMaterialItem({required this.studyMaterial, super.key});

  @override
  Widget build(BuildContext context) {
    final fileName = studyMaterial.displayName ?? intl.error;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: Dimensions.paddingAllSmall,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12, width: 0.5),
      ),
      child: Row(
        children: [
          // Leading Icon
          IconBox(
            size: 28,
            icon: Icons.insert_drive_file_rounded,
            iconBackgroundColor: Colors.blueAccent.withOpacity(0.2),
          ),
          const SizedBox(width: 12),

          // File Name + Subtitle
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
                  'Document',
                  style: textTheme.labelSmall?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // Trailing Action (Download / Open button)
          IconButton(
            icon: const Icon(Icons.download_rounded, size: 20),
            onPressed: () {},
          ),
        ],
      ),
    );
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
