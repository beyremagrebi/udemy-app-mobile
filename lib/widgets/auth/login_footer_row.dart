import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth/login_footer_view_model.dart';

class LoginFooterRow extends StatelessWidget {
  const LoginFooterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return ChangeNotifierProvider(
      create: LoginFooterViewModel.new,
      child: Consumer<LoginFooterViewModel>(
        builder: (context, viewModel, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: viewModel.rememberMe,
                    onChanged: (val) => viewModel.toggleRemember(value: val),
                    checkColor: themeViewModel.currentTheme.primary,
                    fillColor: WidgetStateProperty.all(Colors.white),
                    side: const BorderSide(color: Colors.white, width: 2),
                  ),
                  Flexible(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          viewModel.toggleRemember(
                              value: !viewModel.rememberMe);
                        },
                        child: Text(
                          intl.rememberMe,
                          style: textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Dimensions.widthSmall,
            Flexible(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    intl.forgotPassword,
                    style: textTheme.labelSmall?.copyWith(
                      color: themeViewModel.currentTheme.secondary,
                      decoration: TextDecoration.underline,
                      decorationColor: themeViewModel.currentTheme.secondary,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
