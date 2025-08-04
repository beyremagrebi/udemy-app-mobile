import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/global/facility.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:erudaxis/presentation/utils/session/app_initialize.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:erudaxis/providers/main/bottom_navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:provider/provider.dart';

import '../../core/enum/facility_type.dart';
import '../../providers/admin/facility_view_model.dart';

class FacilityView extends StatelessWidget {
  final SessionManager sessionManager;
  const FacilityView({required this.sessionManager, super.key});

  @override
  Widget build(BuildContext context) {
    final validFacilities = (sessionManager.user?.ownedFacilities ?? [])
        .where((facility) =>
            FacilityType.fromBackendValue(facility.type?.databaseValue) != null)
        .toList();

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
                itemCount: validFacilities.length,
                itemBuilder: (context, index) {
                  final facility = validFacilities[index];
                  return Column(
                    children: [
                      _buildCardFacility(
                        context: context,
                        facility: facility,
                        sessionManager: sessionManager,
                      ),
                      if (index != validFacilities.length - 1)
                        Dimensions.heightSmall,
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardFacility({
    required BuildContext context,
    required Facility facility,
    required SessionManager sessionManager,
  }) {
    return Consumer<BottomNavigationViewModel>(
      builder: (context, navViewModel, child) => Card(
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              final viewModel =
                  FacilityViewModel(context, sessionManager: sessionManager);

              await viewModel.onSelect(facility);

              if (context.mounted) {
                if (!Navigator.canPop(context)) {
                  AppStarter.safeNavigateToMainScreen(
                    context: context,
                    sm: sessionManager,
                    facilityId: facility.id,
                  );
                } else {
                  navViewModel.onSelectChange(0);
                  Navigator.of(context).pop(true);
                }
              }
            },
            child: SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding: Dimensions.paddingAllSmall,
                child: Row(
                  children: [
                    const IconBox(
                      icon: Symbols.domain_rounded,
                      size: 50,
                    ),
                    Dimensions.widthMedium,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            facility.name ?? intl.error,
                            style: textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${intl.establishment} ${facility.type?.name}',
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
