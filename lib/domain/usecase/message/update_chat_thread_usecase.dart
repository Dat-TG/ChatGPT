import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/domain/repository/message/message_repository.dart';

class UpdateChatThreadUseCase extends UseCase<int, ChatThread> {
  final MessageRepository _messageRepository;

  UpdateChatThreadUseCase(this._messageRepository);

  @override
  Future<int> call({required ChatThread params}) {
    return _messageRepository.updateChatThread(params);
  }
}
