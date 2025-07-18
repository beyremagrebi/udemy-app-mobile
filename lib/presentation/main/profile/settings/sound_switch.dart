import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:flutter/material.dart';

class SoundSwitch extends IScreenWithLocalization {
  const SoundSwitch({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            const Icon(Icons.volume_up_outlined),
            Dimensions.widthSmall,
            Expanded(child: Text(intl.son)),
            Transform.scale(
              scale: 0.7,
              child: Switch(
                activeColor: Colors.white,
                trackOutlineWidth: WidgetStateProperty.resolveWith<double>(
                  (states) => 0.1,
                ),
                trackOutlineColor:
                    WidgetStateProperty.resolveWith<Color?>((states) {
                  return Colors.white;
                }),
                activeTrackColor: Colors.green,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.white30,
                autofocus: true,
                value: true,
                onChanged: (value) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
