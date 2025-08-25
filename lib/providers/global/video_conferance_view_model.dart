import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:provider/provider.dart';

import '../../models/global/user.dart';

class VideoConferenceViewModel extends BaseViewModel {
  final JitsiMeet _jitsiMeet = JitsiMeet();

  VideoConferenceViewModel(super.context);

  Future<void> joinConference(String roomName) async {
    final User? user = mainContext.read<SessionManager>().user;

    if (user == null) {
      throw Exception('User not authenticated');
    }

    if (roomName.isEmpty) {
      throw Exception('Room name cannot be empty');
    }
    final options = JitsiMeetConferenceOptions(
      serverURL: 'https://sadkbhwp62nt7x.studiffy.com',
      room: roomName.trim(),
      configOverrides: {
        'startWithAudioMuted': false,
        'startWithVideoMuted': false,
        'prejoinPageEnabled': true,
        'enableWelcomePage': false,
        'subject': 'Erudaxis Conference',
        'disableModeratorIndicator': false,
        'startScreenSharing': false,
      },
      featureFlags: {
        'pip.enabled': true,
        'fullscreen.enabled': true,
        'resolution': FeatureFlagVideoResolutions.resolution720p,
      },
      userInfo: JitsiMeetUserInfo(
        displayName: '${user.firstName} ${user.lastName}',
        email: user.email,
        avatar:
            '$baseURl/enterprise-${FacilityManager.facility.enterprise?.id}/images/${user.image}',
      ),
    );

    await _jitsiMeet.join(options);
  }
}
