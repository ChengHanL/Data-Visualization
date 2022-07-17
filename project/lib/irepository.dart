import 'package:testproject/message_dto.dart';

abstract class IRepository {
  Future<MessageDTO> retrieveMessage();
}
