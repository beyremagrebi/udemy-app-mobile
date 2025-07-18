import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/dimensions.dart';

class SombreMode extends IScreenWithLocalization {
  const SombreMode({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return Consumer<ThemeViewModel>(
      builder: (context, viewModel, child) => Card(
        elevation: 0,
        child: Padding(
          padding: Dimensions.paddingAllSmall,
          child: Row(
            children: [
              const Icon(Icons.dark_mode_outlined),
              Dimensions.widthSmall,
              Expanded(child: Text(intl.sombre)),
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
                  value: viewModel.sombre,
                  onChanged: (value) {
                    viewModel.setSombreTheme(value: value);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
