import 'dart:async';
import 'dart:developer';

import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/models/global/message.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/global/message_services.dart';
import 'package:flutter/material.dart';

import '../../../core/config/socket_manager.dart';
import '../../../presentation/utils/session/token_manager.dart';

class MessagesViewModel extends BaseViewModel {
  BaseChat chatRoom;
  List<Message>? messages;
  final TextEditingController controller = TextEditingController();
  Timer? _typingTimer;
  final GlobalKey<AnimatedListState> listKey = GlobalKey();
  MessagesViewModel(super.context, {required this.chatRoom}) {
    loadMessages();
  }
  @override
  void dispose() {
    _typingTimer?.cancel();
    SocketManager.socket.off('message-received');
    _typingTimer = null;
    super.dispose();
  }

  Future<void> loadMessages() async {
    await makeApiCall(
      displayLoading: false,
      apiCall: MessageServices().getMessagesByRoom(roomId: chatRoom.id),
      onSuccess: (messagesFetched) {
        messages = messagesFetched;
        recieveMessage();
      },
    );
  }

  void recieveMessage() {
    SocketManager.socket.off('message-received');
    SocketManager.socket.on(
      'message-received',
      (data) {
        log('listener');
        messages ??= [];
        messages?.insert(
          0,
          Message(
            id: '',
            message: data['message']?.toString(),
            author: User(
              id: data['userId'].toString(),
            ),
          ),
        );
        listKey.currentState?.insertItem(0);
        update();
      },
    );
  }

  Future<void> sendMessage() async {
    await makeApiCall(
      displayShimmer: false,
      displayOverlay: false,
      apiCall: MessageServices()
          .sendMessage(message: controller.text.trim(), roomId: chatRoom.id),
      onSuccess: (model) {
        SocketManager.socket.emit(
          'new-message',
          {
            'message': controller.text.trim(),
            'userId': TokenManager.extractIdFromToken(),
            'room': chatRoom.id
          },
        );

        controller.text = '';
      },
    );
  }

  void stopTypingMessage() {
    SocketManager.socket.emit(
      'stop-typing-in-room',
      {
        'UserID': TokenManager.extractIdFromToken(),
        'Room': chatRoom.id,
      },
    );

    _typingTimer?.cancel();
    _typingTimer = null;
  }

  void typingMessage() {
    _typingTimer?.cancel();

    SocketManager.socket.emit(
      'typing-in-room',
      {
        'userId': TokenManager.extractIdFromToken(),
        'room': chatRoom.id,
      },
    );

    _typingTimer = Timer(const Duration(milliseconds: 800), stopTypingMessage);
  }
}
