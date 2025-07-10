import 'dart:ui';

import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/app_colors.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/main/profile/theme/theme_view_model.dart';

class InputText extends IScreenWithLocalization {
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? label;
  final bool required;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final bool enabled;

  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String? errorText;
  final bool showErrorText;

  const InputText({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.label,
    this.required = false,
    this.obscureText = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.enabled = true,
    this.validator,
    this.autovalidateMode,
    this.errorText,
    this.showErrorText = true,
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
                      fontSize: 8),
                ),
              ]
            ],
          ),
        Dimensions.heightxSmall,
        ClipRRect(
          borderRadius: Dimensions.smallBorderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              keyboardType: keyboardType,
              obscureText: obscureText,
              autofocus: autofocus,
              maxLines: maxLines,
              minLines: minLines,
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              onEditingComplete: onEditingComplete,
              enabled: enabled,
              validator: validator,
              autovalidateMode: autovalidateMode,
              style: textTheme.bodySmall
                  ?.copyWith(color: Colors.white, height: 1.2),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: textTheme.labelSmall?.copyWith(
                  color: Colors.white38,
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                isDense: true,
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                contentPadding: Dimensions.paddingAllLarge,
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
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
            ),
          ),
        ),
      ],
    );
  }
}
