import 'dart:ui';

import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  // ✅ Support ALL TextField parameters
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

  const InputText({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.obscureText = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: Dimensions.smallBorderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          obscureText: obscureText,
          autofocus: autofocus,
          maxLines: maxLines,
          minLines: minLines,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
          enabled: enabled,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            isDense: true,
            isCollapsed: true,
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            contentPadding: Dimensions.paddingAllLarge,
            enabledBorder: OutlineInputBorder(
              borderRadius: Dimensions.smallBorderRadius,
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: Dimensions.smallBorderRadius,
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.5,
              ),
            ),
          ),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ),
    );
  }
}
