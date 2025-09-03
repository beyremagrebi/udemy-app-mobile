import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/global/chat_group_services.dart';
import 'package:erudaxis/services/global/chat_private_services.dart';

import '../../../core/config/socket_manager.dart';

class ChatViewModel extends BaseViewModel {
  List<BaseChat>? chatRooms;
  bool privateScreen = true;

  ChatViewModel(super.context) {
    loadChats();
  }

  Future<void> loadChats() async {
    await makeApiCall(
      displayLoading: false,
      apiCall: privateScreen
          ? ChatPrivateServices().getPrivateChats()
          : ChatGroupServices().getGroupChats(),
      onSuccess: (chats) {
        chatRooms = chats;
        final chatIds = chats.map((c) => c.id.toString()).toList();
        SocketManager.joinChatRooms(chatIds);
      },
    );
  }

  Future<void> toggleScreen({bool isPrivate = true}) async {
    privateScreen = isPrivate;
    loadChats();
    update();
  }
}
