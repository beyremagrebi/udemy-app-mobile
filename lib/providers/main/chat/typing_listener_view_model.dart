import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/foundation.dart';

import '../../../core/config/socket_manager.dart';

class TypingListenerViewModel extends BaseViewModel {
  final Map<String, Set<String>> typingUsers = {};

  TypingListenerViewModel(super.context);

  List<String> getTypingUsers(String roomId) {
    return typingUsers[roomId]?.toList() ?? [];
  }

  void initializeListener() {
    listenTypingInRoom();
    listenStopTypingInRoom();
  }

  void listenStopTypingInRoom() {
    SocketManager.socket.off('stop-typing');
    SocketManager.socket.on('stop-typing', (data) {
      debugPrint('User stop typing event received: $data');

      final roomId = data['room']?.toString();
      final userId = data['userId']?.toString();

      if (roomId != null && userId != null) {
        if (typingUsers.containsKey(roomId)) {
          typingUsers[roomId]!.remove(userId);

          // Clean up empty sets to avoid memory leaks
          if (typingUsers[roomId]!.isEmpty) {
            typingUsers.remove(roomId);
          }
          update();
        }
      }
    });
  }

  void listenTypingInRoom() {
    SocketManager.socket.off('user-typing');
    SocketManager.socket.on('user-typing', (data) {
      debugPrint('User typing event received: $data');

      final roomId = data['room']?.toString();
      final userId = data['userId']?.toString();

      if (roomId != null &&
          userId != null &&
          userId != TokenManager.extractIdFromToken()) {
        typingUsers.putIfAbsent(roomId, () => <String>{});
        typingUsers[roomId]!.add(userId);
        update();
      }
    });
  }
}
