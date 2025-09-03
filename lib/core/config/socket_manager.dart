import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../constants/env.dart';

class SocketManager {
  static late io.Socket socket;

  static void disconnect() {
    socket.disconnect();
  }

  static Future<void> initialize() async {
    try {
      socket = io.io(
        socketUrl,
        io.OptionBuilder()
            .setTransports(['websocket', 'polling'])
            .enableAutoConnect()
            .enableForceNew()
            .setTimeout(30000)
            .build(),
      );

      socket.onConnect((_) {
        debugPrint('Socket connected: ${socket.id}');
      });

      socket.onDisconnect((_) {
        debugPrint('Socket disconnected');
      });

      socket.onError((error) {
        debugPrint('Socket error: $error');
      });

      socket.onConnectError((error) {
        debugPrint('Connect error: $error');
      });

      socket.connect();
    } on Exception catch (e) {
      debugPrint('Socket initialization error: ${e.toString()}');
    }
  }

  static void joinChatRooms(List<String> chatIds) {
    if (socket.connected) {
      socket.emit('join-chat-room', {
        'chatIds': chatIds,
      });
      debugPrint('Requested join for chat rooms: $chatIds');
    } else {
      debugPrint('Socket not connected yet. Cannot join rooms.');
    }
  }
}
