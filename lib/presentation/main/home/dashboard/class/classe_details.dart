import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/presentation/main/home/dashboard/class/action_class_details_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/class/app_bar_class_details_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/class/members_class_view.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/dimensions.dart';
import 'activity_recent_view.dart';

class ClasseDetails extends StatelessWidget {
  final BaseClass classe;
  const ClasseDetails({required this.classe, super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarGradient(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          AppBarClassDetailsView(classe: classe),
          Expanded(
            child: ListView(
              padding: Dimensions.paddingAllMedium,
              children: [
                ActionClassDetailsView(
                  classe: classe,
                ),
                Dimensions.heightMedium,
                MembersClassView(
                  classe: classe,
                ),
                Dimensions.heightMedium,
                const ActivityRecentView()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
