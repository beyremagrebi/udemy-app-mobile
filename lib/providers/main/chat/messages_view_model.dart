import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/models/global/message.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/global/message_services.dart';

class MessagesViewModel extends BaseViewModel {
  BaseChat chatRoom;
  List<Message>? messages;
  MessagesViewModel(super.context, {required this.chatRoom}) {
    loadMessages();
  }

  Future<void> loadMessages() async {
    await makeApiCall(
      displayLoading: false,
      apiCall: MessageServices().getMessagesByRoom(roomId: chatRoom.id),
      onSuccess: (messagesFetched) {
        messages = messagesFetched;
      },
    );
  }
}
