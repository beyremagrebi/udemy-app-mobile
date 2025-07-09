import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/enum/theme_app.dart';
import '../../../../core/styles/app_colors.dart';

class ThemeView extends IScreenWithLocalization {
  const ThemeView({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return AppScaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBarGradient(
        title: const Text('Themes'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Consumer<ThemeViewModel>(
        builder: (context, viewModel, child) => Column(
          children: [
            _buildCurrentThemePreview(viewModel),
            Expanded(
              child: ListView.separated(
                padding: Dimensions.paddingAllMedium,
                itemCount: ThemeApp.values.length,
                separatorBuilder: (context, index) => Dimensions.heightSmall,
                itemBuilder: (context, index) => _buildThemeListItem(
                  ThemeApp.values[index],
                  viewModel,
                  index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentThemePreview(ThemeViewModel viewModel) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            if (viewModel.currentTheme == ThemeApp.defaultTheme) ...[
              AppColors.surfaceGradientEnd,
              const Color.fromARGB(255, 41, 72, 248),
              const Color.fromARGB(255, 41, 72, 248),
            ] else ...[
              viewModel.currentTheme.primary,
              viewModel.currentTheme.secondary,
            ]
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        margin: Dimensions.horizontalPaddingLarge,
        child: Padding(
          padding: Dimensions.paddingAllSmall,
          child: Row(
            children: [
              Icon(
                viewModel.currentTheme.icon,
                color: Colors.white,
                size: 28,
              ),
              Dimensions.widthMedium,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      viewModel.currentTheme.getLocalizedName(),
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(intl.active_theme_label,
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 13,
                        )),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(intl.active_chip,
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeListItem(
      ThemeApp theme, ThemeViewModel viewModel, int index) {
    final bool isSelected = viewModel.currentTheme == theme;

    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => viewModel.selectTheme(theme),
          child: Container(
            padding: Dimensions.paddingAllxSmall,
            decoration: BoxDecoration(
              borderRadius: Dimensions.smallBorderRadius,
              border: isSelected
                  ? Border.all(color: Colors.white, width: 1.2)
                  : null,
            ),
            child: Row(
              children: [
                IconBox(
                  icon: theme.icon,
                  iconBackgroundColor: theme.primary,
                ),
                Dimensions.widthSmall,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        theme.getLocalizedName(),
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: theme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Dimensions.widthxSmall,
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: theme.secondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Dimensions.widthxSmall,
                          Text(
                            intl.primary_secondary,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: isSelected ? theme.primary : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? theme.primary : Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 13,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
