import 'package:erudaxis/core/config/media/api_image_widget.dart';
import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/providers/main/home/class/members_class_view_model.dart';
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
            shimmer: MemberCardShimmer(),
            builder: (users) => LimitedListView(
              children: List.generate(
                users.length,
                (index) => _buildMemberCard(user: users[index]),
              ),
              itemHeight: 55,
              separatorHeight: Dimensions.s,
            ),
          ),
        ),
        title: 'Memebers',
        materialPage: Container(),
        onTap: () {},
        icon: Icons.people_alt_outlined,
      ),
    );
  }

  Widget _buildMemberCard({required User user}) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: Dimensions.s),
      child: Container(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            ApiImageWidget(
              height: 35,
              width: 35,
              hasImageView: true,
              imageNetworUrl: '$baseURl/enterprise-${user.enterprise}/images',
              isMen: user.isMen,
              imageFileName: user.image,
              isProfilePicture: true,
            ),
            Dimensions.widthSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    user.role?.localizedName().toUpperCase() ?? intl.error,
                    style: textTheme.labelSmall?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.more_vert_outlined,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
