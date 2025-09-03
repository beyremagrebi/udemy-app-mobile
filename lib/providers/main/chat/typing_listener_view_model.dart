import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/foundation.dart';

import '../../../core/config/socket_manager.dart';

class TypingListenerViewModel extends BaseViewModel {
  final Map<String, String?> typingUsers = {};
  TypingListenerViewModel(super.context);
  void initializeListener() {
    listenTypingInRoom();
    listenStopTypingInRoom();
  }

  void listenStopTypingInRoom() {
    SocketManager.socket.off('stop-typing');
    SocketManager.socket.on('stop-typing', (data) {
      debugPrint('User stop typing event received: $data');
      final roomId = data['room']?.toString();
      if (roomId != null) {
        typingUsers.remove(roomId);
        update();
      }
    });
  }

  void listenTypingInRoom() {
    SocketManager.socket.off('user-typing');
    SocketManager.socket.on('user-typing', (data) {
      debugPrint('User typing event received: $data');
      final roomId = data['room']?.toString();
      final userId = data['userId']?.toString();

      if (roomId != null && userId != TokenManager.extractIdFromToken()) {
        typingUsers[roomId] = userId;
        update();
      }
    });
  }
}
