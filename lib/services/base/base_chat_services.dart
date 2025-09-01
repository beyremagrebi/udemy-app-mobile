import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/services/base_service.dart';

abstract class BaseChatServices<T extends BaseChat> extends BaseService<T> {
  final T Function(dynamic json) _fromMap;

  BaseChatServices(this._fromMap);

  @override
  T Function(dynamic json) get fromMapFunction => _fromMap;
}
