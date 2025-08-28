import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:flutter/material.dart';
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
        'startWithAudioMuted': true,
        'startWithVideoMuted': true,
        'enableWelcomePage': true,
        'subject': 'Erudaxis',
        'startScreenSharing': false,
      },
      featureFlags: {},
      userInfo: JitsiMeetUserInfo(
        displayName: '${user.firstName} ${user.lastName}',
        email: user.email,
        avatar:
            '$baseURl/enterprise-${FacilityManager.facility.enterprise?.id}/images/${user.image}',
      ),
    );
    await _jitsiMeet.setAudioMuted(true);
    await _jitsiMeet.setVideoMuted(true);
    await _jitsiMeet.join(options, listener());
  }

  JitsiMeetEventListener listener() {
    final JitsiMeetEventListener listener = JitsiMeetEventListener(
      conferenceWillJoin: (url) {
        debugPrint('Conference will join: $url');
      },
      conferenceJoined: (url) {
        debugPrint('Conference joined: $url');
      },
      conferenceTerminated: (url, error) {
        debugPrint('Conference terminated: $url, error: $error');
      },
      audioMutedChanged: (muted) {
        debugPrint('Audio muted: $muted');
      },
      videoMutedChanged: (muted) {
        debugPrint('Video muted: $muted');
      },
      participantJoined: (email, name, role, participantId) {
        debugPrint(
            'Participant joined: $name, id: $participantId, role: $role');
      },
      participantLeft: (participantId) {
        debugPrint('Participant left: id $participantId');
      },
      chatMessageReceived: (senderId, message, isPrivate, timestamp) => {
        debugPrint(
            'Chat message from $senderId: $message (private: $isPrivate)')
      },
      screenShareToggled: (participantId, sharing) {
        debugPrint('Screen share by $participantId: $sharing');
      },
    );

    return listener;
  }
}
