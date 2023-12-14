import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/domain/repository/message/message_repository.dart';

class SaveChatThreadUseCase extends UseCase<int, ChatThread> {
  final MessageRepository _messageRepository;

  SaveChatThreadUseCase(this._messageRepository);

  @override
  Future<int> call({required ChatThread params}) {
    return _messageRepository.saveChatThread(params);
  }
}
