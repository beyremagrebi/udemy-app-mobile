import 'dart:async';

import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/models/global/message.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/global/message_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/socket_manager.dart';
import '../../../presentation/utils/session/token_manager.dart';
import '../../global/notification_view_model.dart';

class MessagesViewModel extends BaseViewModel {
  BaseChat chatRoom;
  List<Message>? messages;
  final TextEditingController controller = TextEditingController();
  Timer? _typingTimer;
  final GlobalKey<AnimatedListState> listKey = GlobalKey();
  late NotificationViewModel _notificationVM;
  MessagesViewModel(super.context, {required this.chatRoom}) {
    loadMessages();
    _notificationVM = context.read<NotificationViewModel>();
  }
  @override
  void dispose() {
    _typingTimer?.cancel();
    SocketManager.socket.off('message-received');
    readAllMessages();
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

  void readAllMessages() {
    _notificationVM.readAllChatRoomNotifications(chatRoom.id);
  }

  void recieveMessage() {
    SocketManager.socket.off('message-received');
    SocketManager.socket.on(
      'message-received',
      (data) {
        messages ??= [];
        messages?.insert(
          0,
          Message(
            id: '',
            message: data['message']?.toString(),
            author: chatRoom.users?.firstWhere(
              (user) => user.id == data['userId'].toString(),
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
