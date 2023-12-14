import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/domain/repository/message/message_repository.dart';

class GetAllChatThreadsUseCase extends UseCase<List<ChatThread>, void> {
  final MessageRepository _messageRepository;

  GetAllChatThreadsUseCase(this._messageRepository);

  @override
  Future<List<ChatThread>> call({required void params}) {
    return _messageRepository.getAllChatThreads();
  }
}
