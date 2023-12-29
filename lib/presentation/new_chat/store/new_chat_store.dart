import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/domain/entity/message/message.dart';
import 'package:boilerplate/domain/entity/message/message_with_time.dart';
import 'package:boilerplate/domain/usecase/message/save_chat_thread_usecase.dart';
import 'package:boilerplate/domain/usecase/message/send_message_usecase.dart';
import 'package:boilerplate/presentation/chat_screen/store/chat_store.dart';

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
  MessageWithTime userMessage =
      MessageWithTime(Message(role: Role.user, content: ''), DateTime.now());

  @observable
  ObservableFuture<Message?> sendMessageFuture = ObservableFuture.value(null);

  @computed
  bool get isLoading => sendMessageFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future sendMessage(String content) async {
    final Message message = Message(role: Role.user, content: content);
    final time = DateTime.now();
    userMessage = MessageWithTime(message, time);
    final future = _sendMessageUseCase.call(params: [message]);
    sendMessageFuture = ObservableFuture(future);

    await future.then((value) async {
      print('response message ${value.toMap()}');
      final chatThread = ChatThread(
        id: time.millisecondsSinceEpoch,
        subject: message.content,
        messages: [
          MessageWithTime(message, time),
          MessageWithTime(value, time),
        ],
      );
      await _saveChatThreadUseCase.call(
        params: chatThread,
      );
      this.success = true;
      ChatStore _chatStore = getIt<ChatStore>();
      _chatStore.setChatThreads([..._chatStore.chatThreads, chatThread]);
      _chatStore.setChatThreadId(chatThread.id);
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
