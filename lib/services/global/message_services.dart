import 'package:erudaxis/models/global/message.dart';
import 'package:erudaxis/services/base_service.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';

class MessageServices extends BaseService<Message> {
  @override
  Message Function(dynamic json) get fromMapFunction => Message.fromMap;

  Future<ApiResponse<List<Message>>> getMessagesByRoom(
      {required String? roomId}) async {
    return ApiService.instance.request<List<Message>>(
      url: '$endpoint/message/$roomId',
      fromJson: (json) => (json as List).map<Message>(Message.fromMap).toList(),
    );
  }
}
