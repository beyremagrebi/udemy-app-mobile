import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/global/facility.dart';
import 'package:erudaxis/presentation/main/main_view.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:flutter/material.dart';

class FacilityView extends StatelessWidget {
  final SessionManager sessionManager;
  const FacilityView({required this.sessionManager, super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: AppBarGradient(
          title: const Text('Choisissez votre établissement'),
        ),
        body: Padding(
          padding: Dimensions.paddingAllMedium,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: sessionManager.user?.ownedFacilities?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        _buildCardFacility(
                            context: context,
                            facility:
                                sessionManager.user?.ownedFacilities?[index]),
                        if (index !=
                            (sessionManager.user?.ownedFacilities?.length ??
                                    0) -
                                1)
                          Dimensions.heightSmall, // space between cards
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildCardFacility(
      {required BuildContext context, Facility? facility}) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            await sessionManager.loadFacility(facility?.id);
            if (context.mounted) {
              navigateToDeleteTree(context, const MainView());
            }
          },
          child: SizedBox(
            width: double.maxFinite,
            child: Padding(
              padding: Dimensions.paddingAllSmall,
              child: Row(
                children: [
                  const IconBox(
                    icon: Icons.school,
                    size: 50,
                  ),
                  Dimensions.widthMedium,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        facility?.name ?? intl.error,
                        style: textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${intl.establishment} ${facility?.type?.name}',
                        style: textTheme.labelSmall?.copyWith(
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  )),
                  const Icon(Icons.navigate_next)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
