import 'package:erudaxis/models/global/chat_group.dart';
import 'package:erudaxis/services/base/base_chat_services.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';

class ChatGroupServices extends BaseChatServices {
  ChatGroupServices() : super(ChatGroup.fromMap);

  Future<ApiResponse<List<ChatGroup>>> getGroupChats() async {
    return ApiService.instance.request<List<ChatGroup>>(
      url: '$endpoint/get-group-chats',
      fromJson: (json) =>
          (json as List).map<ChatGroup>(ChatGroup.fromMap).toList(),
    );
  }
}
