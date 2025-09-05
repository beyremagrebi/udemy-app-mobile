import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/providers/global/notification_view_model.dart';
import 'package:erudaxis/services/global/chat_group_services.dart';
import 'package:erudaxis/services/global/chat_private_services.dart';
import 'package:provider/provider.dart';

import '../../../core/config/socket_manager.dart';

class ChatViewModel extends BaseViewModel {
  List<BaseChat>? chatRooms;
  bool privateScreen = true;

  ChatViewModel(super.context) {
    loadChats();
  }

  @override
  void dispose() {
    print('dipsose');
    super.dispose();
  }

  Future<void> loadChats() async {
    final viewModel = context.read<NotificationViewModel>();
    await makeApiCall(
      displayLoading: false,
      apiCall: privateScreen
          ? ChatPrivateServices().getPrivateChats()
          : ChatGroupServices().getGroupChats(),
      onSuccess: (chats) {
        chatRooms = chats;
        final chatIds = chats.map((c) => c.id.toString()).toList();
        viewModel.loadAllRoomNotifications(chatIds);
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
