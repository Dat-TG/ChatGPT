import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/domain/entity/message/message.dart';
import 'package:boilerplate/domain/entity/message/message_with_time.dart';
import 'package:boilerplate/domain/usecase/message/get_all_chat_threads_usecase.dart';
import 'package:boilerplate/domain/usecase/message/send_message_usecase.dart';
import 'package:boilerplate/domain/usecase/message/update_chat_thread_usecase.dart';

import 'package:mobx/mobx.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  // constructor:---------------------------------------------------------------
  _ChatStore(
    this.errorStore,
    this._sendMessageUseCase,
    this._getAllChatThreadsUseCase,
    this._updateChatThreadUseCase,
  ) {
    // load all chat threads
    getAllChatThreads();
    // setting up disposers
    _setupDisposers();
  }

  // use cases:-----------------------------------------------------------------
  final SendMessageUseCase _sendMessageUseCase;
  final GetAllChatThreadsUseCase _getAllChatThreadsUseCase;
  final UpdateChatThreadUseCase _updateChatThreadUseCase;

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
  int id = 0;

  @observable
  List<ChatThread> chatThreads = [];

  @observable
  ObservableFuture<List<ChatThread>?> chatThreadsFuture =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<Message?> sendMessageFuture = ObservableFuture.value(null);

  @observable
  ObservableFuture<int?> updateChatThreadFuture = ObservableFuture.value(null);

  @computed
  bool get isLoading =>
      sendMessageFuture.status == FutureStatus.pending ||
      updateChatThreadFuture.status == FutureStatus.pending;

  @computed
  bool get isLoadingChatThreads =>
      chatThreadsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future setChatThreadId(int newId) async {
    id = newId;
  }

  @action
  Future setChatThreads(List<ChatThread> newChatThreads) async {
    chatThreads = newChatThreads;
  }

  @action
  Future getAllChatThreads() async {
    final future = _getAllChatThreadsUseCase.call();
    chatThreadsFuture = ObservableFuture(future);

    await future.then((value) async {
      print('response message ${value}');
      this.success = true;
      this.chatThreads = value;
    }).catchError((e) {
      print(e);
      this.success = false;
      throw e;
    });
  }

  @action
  Future sendMessage(String content) async {
    final Message message = Message(role: Role.user, content: content);
    final time = DateTime.now();
    final messages = chatThreads
        .firstWhere((element) => element.id == id)
        .messages
        .map((e) => e.message)
        .toList();
    chatThreads
        .firstWhere((element) => element.id == id)
        .messages
        .add(MessageWithTime(message, time));
    final future = _sendMessageUseCase.call(params: [...messages, message]);
    sendMessageFuture = ObservableFuture(future);

    await future.then((value) async {
      print('response message ${value.toMap()}');
      final newChatThread =
          chatThreads.firstWhere((element) => element.id == id);
      newChatThread.messages.add(
        MessageWithTime(
          value,
          DateTime.now(),
        ),
      );
      print(newChatThread);
      final future = _updateChatThreadUseCase.call(
        params: newChatThread,
      );
      updateChatThreadFuture = ObservableFuture(future);
      await future.then((value) => {this.success = true});
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
