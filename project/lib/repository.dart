import 'package:testproject/api.dart';
import 'package:testproject/irepository.dart';
import 'package:testproject/message_dto.dart';

class Repository implements IRepository {
  Repository(this._api);
  final Api _api;

  @override
  Future<MessageDTO> retrieveMessage() => _api.retrieveMessage();
}
