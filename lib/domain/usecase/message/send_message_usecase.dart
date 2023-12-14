import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/message/message.dart';
import 'package:boilerplate/domain/repository/message/message_repository.dart';

class SendMessageUseCase extends UseCase<Message, List<Message>> {
  final MessageRepository _messageRepository;

  SendMessageUseCase(this._messageRepository);

  @override
  Future<Message> call({required List<Message> params}) {
    return _messageRepository.sendMessage(params);
  }
}
