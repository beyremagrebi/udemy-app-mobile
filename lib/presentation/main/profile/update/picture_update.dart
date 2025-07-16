import 'package:erudaxis/providers/main/profile/update/personal_information_validator.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/media/api_image_widget.dart';
import '../../../../core/config/media/file_image_widget.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/constants/env.dart';
import '../../../../core/styles/dimensions.dart';

class PictureUpdate extends StatelessWidget {
  final PersonalInformationValidator viewModel;

  const PictureUpdate({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onLongPress: viewModel.onLongPress,
            onTap: () {
              viewModel.removeIcon == true
                  ? viewModel.removeImage()
                  : viewModel.selectImage();
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                if (viewModel.imageFilePath == null)
                  Opacity(
                    opacity: viewModel.removeIcon == true ? 0.6 : 1,
                    child: ApiImageWidget(
                      height: 60,
                      width: 60,
                      imageFileName: viewModel.user?.image,
                      isMen: viewModel.user?.isMen,
                      border: Border.all(color: Colors.white, width: 1.2),
                      imageNetworUrl:
                          '$baseURl/enterprise-${viewModel.user?.enterprise}/images',
                      isProfilePicture: true,
                    ),
                  ),
                if (viewModel.imageFilePath != null)
                  Opacity(
                    opacity: viewModel.removeIcon == true ? 0.6 : 1,
                    child: FileImageWidget(
                      height: 60,
                      width: 60,
                      imageFileName: viewModel.imageFilePath,
                      fit: BoxFit.cover,
                      border: Border.all(color: Colors.white, width: 1.2),
                      isProfilePicture: true,
                    ),
                  ),
                Container(
                  padding: Dimensions.paddingAllxSmall,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    viewModel.removeIcon == true
                        ? Icons.delete
                        : Icons.edit_square,
                    size: 14,
                    color: viewModel.removeIcon
                        ? Colors.red.shade300
                        : Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
        Text(intl.required)
      ],
    );
  }
}
