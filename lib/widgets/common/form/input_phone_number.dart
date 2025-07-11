import 'dart:ui';

import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/app_colors.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../../../providers/main/profile/theme/theme_view_model.dart';

class InputPhoneNumber extends IScreenWithLocalization {
  final PhoneNumber initialValue;
  final void Function(PhoneNumber) onInputChanged;

  final String? hintText;
  final String? label;
  final bool required;
  final bool autofocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? errorText;
  final bool showErrorText;
  final AutovalidateMode? autoValidateMode;

  const InputPhoneNumber({
    required this.initialValue,
    required this.onInputChanged,
    super.key,
    this.hintText,
    this.label,
    this.required = false,
    this.autofocus = false,
    this.controller,
    this.focusNode,
    this.errorText,
    this.showErrorText = true,
    this.autoValidateMode,
  });

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    final viewModel = context.watch<ThemeViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Row(
            children: [
              Text(
                label.toString(),
                style: textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                ),
              ),
              if (required) ...[
                const Expanded(child: Dimensions.widthSmall),
                Text(
                  intl.obligatoire,
                  style: textTheme.labelSmall?.copyWith(
                    color: viewModel.currentTheme.secondary.withGreen(200),
                    fontSize: 8,
                  ),
                ),
              ]
            ],
          ),
        Dimensions.heightxSmall,
        ClipRRect(
          borderRadius: Dimensions.smallBorderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: InternationalPhoneNumberInput(
              textStyle: textTheme.bodyMedium?.copyWith(fontSize: 12),
              onInputChanged: onInputChanged,
              autoFocus: autofocus,
              initialValue: initialValue,
              focusNode: focusNode,
              textFieldController: controller,
              cursorColor: Colors.white,
              selectorConfig: const SelectorConfig(
                setSelectorButtonAsPrefixIcon: true,
                useEmoji: true,
                showFlags: false,
                useBottomSheetSafeArea: true,
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              spaceBetweenSelectorAndTextField: 8,
              inputDecoration: InputDecoration(
                hintText: hintText,
                hintStyle: textTheme.labelSmall?.copyWith(
                  color: Colors.white38,
                  fontSize: 12,
                ),
                isDense: true,
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                contentPadding: Dimensions.paddingAllSmall,
                enabledBorder: OutlineInputBorder(
                  borderRadius: Dimensions.smallBorderRadius,
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: Dimensions.smallBorderRadius,
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.5,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: Dimensions.smallBorderRadius,
                  borderSide: BorderSide(
                    color: AppColors.error,
                    width: 1.5,
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: Dimensions.smallBorderRadius,
                  borderSide: BorderSide(
                    color: AppColors.error,
                    width: 2,
                  ),
                ),
                errorText: showErrorText ? errorText : null,
                errorStyle: showErrorText ? null : const TextStyle(height: 0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
