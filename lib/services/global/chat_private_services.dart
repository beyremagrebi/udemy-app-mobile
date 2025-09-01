import 'package:erudaxis/models/global/chat_private.dart';
import 'package:erudaxis/services/base/base_chat_services.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';

class ChatPrivateServices extends BaseChatServices {
  ChatPrivateServices() : super(ChatPrivate.fromMap);

  Future<ApiResponse<List<ChatPrivate>>> getPrivateChats() async {
    return ApiService.instance.request<List<ChatPrivate>>(
      url: '$endpoint/get-private-chats',
      fromJson: (json) =>
          (json as List).map<ChatPrivate>(ChatPrivate.fromMap).toList(),
    );
  }
}
