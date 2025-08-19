import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/providers/main/home/class/members_class_view_model.dart';
import 'package:erudaxis/widgets/common/memeber_card.dart';
import 'package:erudaxis/widgets/shimmer/member_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../../../utils/limited_list_view.dart';
import '../../../../utils/title_widget.dart';

class MembersClassView extends StatelessWidget {
  final BaseClass classe;
  const MembersClassView({required this.classe, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MembersClassViewModel(context, classId: classe.id),
      child: TitleWidget(
        child: Consumer<MembersClassViewModel>(
          builder: (context, viewModel, child) => AsyncModelListBuilder(
            models: viewModel.students,
            viewModel: viewModel,
            onRefresh: viewModel.loadStudents,
            shimmer: MemberCardShimmer(),
            builder: (users) => LimitedListView(
              children: List.generate(
                users.length,
                (index) => MemberCard(user: users[index]),
              ),
              itemHeight: 55,
              separatorHeight: Dimensions.s,
            ),
          ),
        ),
        title: intl.members,
        materialPage: Container(),
        onTap: () {},
        icon: Icons.people_alt_outlined,
      ),
    );
  }
}
