import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/domain/entity/message/message.dart';
import 'package:boilerplate/domain/entity/message/message_with_time.dart';
import 'package:boilerplate/domain/usecase/message/save_chat_thread_usecase.dart';
import 'package:boilerplate/domain/usecase/message/send_message_usecase.dart';

import 'package:mobx/mobx.dart';

part 'new_chat_store.g.dart';

class NewChatStore = _NewChatStore with _$NewChatStore;

abstract class _NewChatStore with Store {
  // constructor:---------------------------------------------------------------
  _NewChatStore(
    this.errorStore,
    this._sendMessageUseCase,
    this._saveChatThreadUseCase,
  ) {
    // setting up disposers
    _setupDisposers();
  }

  // use cases:-----------------------------------------------------------------
  final SendMessageUseCase _sendMessageUseCase;
  final SaveChatThreadUseCase _saveChatThreadUseCase;

  // store for handling error messages
  final ErrorStore errorStore;

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // store variables:-----------------------------------------------------------

  @observable
  bool success = false;

  @observable
  ObservableFuture<Message?> sendMessageFuture = ObservableFuture.value(null);

  @computed
  bool get isLoading => sendMessageFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future sendMessage(String content) async {
    final Message message = Message(role: Role.user, content: content);
    final time = DateTime.now();
    final future = _sendMessageUseCase.call(params: [message]);
    sendMessageFuture = ObservableFuture(future);

    await future.then((value) async {
      print('response message ${value.toMap()}');
      await _saveChatThreadUseCase.call(
        params: ChatThread(
          id: time.millisecondsSinceEpoch,
          subject: 'Chat ${time.millisecondsSinceEpoch}}',
          messages: [
            MessageWithTime(message, time),
            MessageWithTime(value, time),
          ],
        ),
      );
      this.success = true;
    }).catchError((e) {
      print(e);
      this.success = false;
      throw e;
    });
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
