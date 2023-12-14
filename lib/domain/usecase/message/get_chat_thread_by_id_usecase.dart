import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/domain/repository/message/message_repository.dart';

class GetChatThreadByIdUseCase extends UseCase<ChatThread, int> {
  final MessageRepository _messageRepository;

  GetChatThreadByIdUseCase(this._messageRepository);

  @override
  Future<ChatThread> call({required int params}) {
    return _messageRepository.getChatThread(params);
  }
}
