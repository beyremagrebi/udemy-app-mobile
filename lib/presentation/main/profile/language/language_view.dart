import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/widgets/main/profile/language_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/enum/language.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageViewModel>(
      builder: (context, viewModel, child) => AppScaffold(
        appBar: AppBarGradient(
          centerTitle: true,
          title: Text(intl.language_title),
        ),
        body: Padding(
          padding: Dimensions.paddingAllMedium,
          child: Column(
            children: Language.values.map((language) {
              return Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        viewModel.changleLanguage(language);
                      },
                      child: LanguageCard<Language>(
                        language: language,
                        currentLanguage: viewModel.locale.languageCode ==
                            language.langaugeCode,
                        getDisplayName: (lang) => lang.getLocalizedName(),
                      ),
                    ),
                  ),
                  if (language != Language.values.last) Dimensions.heightSmall,
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
