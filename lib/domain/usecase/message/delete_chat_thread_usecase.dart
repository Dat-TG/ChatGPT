import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/repository/message/message_repository.dart';

class DeleteChatThreadUseCase extends UseCase<int, int> {
  final MessageRepository _messageRepository;

  DeleteChatThreadUseCase(this._messageRepository);

  @override
  Future<int> call({required int params}) {
    return _messageRepository.deleteChatThread(params);
  }
}
