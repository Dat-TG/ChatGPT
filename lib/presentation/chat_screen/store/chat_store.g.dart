// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatStore on _ChatStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_ChatStore.isLoading'))
      .value;
  Computed<bool>? _$isLoadingChatThreadsComputed;

  @override
  bool get isLoadingChatThreads => (_$isLoadingChatThreadsComputed ??=
          Computed<bool>(() => super.isLoadingChatThreads,
              name: '_ChatStore.isLoadingChatThreads'))
      .value;
  Computed<bool>? _$isUpdatingChatThreadComputed;

  @override
  bool get isUpdatingChatThread => (_$isUpdatingChatThreadComputed ??=
          Computed<bool>(() => super.isUpdatingChatThread,
              name: '_ChatStore.isUpdatingChatThread'))
      .value;

  late final _$successAtom = Atom(name: '_ChatStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$idAtom = Atom(name: '_ChatStore.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$chatThreadsAtom =
      Atom(name: '_ChatStore.chatThreads', context: context);

  @override
  ObservableList<ChatThread> get chatThreads {
    _$chatThreadsAtom.reportRead();
    return super.chatThreads;
  }

  @override
  set chatThreads(ObservableList<ChatThread> value) {
    _$chatThreadsAtom.reportWrite(value, super.chatThreads, () {
      super.chatThreads = value;
    });
  }

  late final _$chatThreadsFutureAtom =
      Atom(name: '_ChatStore.chatThreadsFuture', context: context);

  @override
  ObservableFuture<List<ChatThread>?> get chatThreadsFuture {
    _$chatThreadsFutureAtom.reportRead();
    return super.chatThreadsFuture;
  }

  @override
  set chatThreadsFuture(ObservableFuture<List<ChatThread>?> value) {
    _$chatThreadsFutureAtom.reportWrite(value, super.chatThreadsFuture, () {
      super.chatThreadsFuture = value;
    });
  }

  late final _$updateChatThreadFutureAtom =
      Atom(name: '_ChatStore.updateChatThreadFuture', context: context);

  @override
  ObservableFuture<int?> get updateChatThreadFuture {
    _$updateChatThreadFutureAtom.reportRead();
    return super.updateChatThreadFuture;
  }

  @override
  set updateChatThreadFuture(ObservableFuture<int?> value) {
    _$updateChatThreadFutureAtom
        .reportWrite(value, super.updateChatThreadFuture, () {
      super.updateChatThreadFuture = value;
    });
  }

  late final _$sendMessageFutureAtom =
      Atom(name: '_ChatStore.sendMessageFuture', context: context);

  @override
  ObservableFuture<Message?> get sendMessageFuture {
    _$sendMessageFutureAtom.reportRead();
    return super.sendMessageFuture;
  }

  @override
  set sendMessageFuture(ObservableFuture<Message?> value) {
    _$sendMessageFutureAtom.reportWrite(value, super.sendMessageFuture, () {
      super.sendMessageFuture = value;
    });
  }

  late final _$setChatThreadIdAsyncAction =
      AsyncAction('_ChatStore.setChatThreadId', context: context);

  @override
  Future<dynamic> setChatThreadId(int newId) {
    return _$setChatThreadIdAsyncAction.run(() => super.setChatThreadId(newId));
  }

  late final _$setChatThreadsAsyncAction =
      AsyncAction('_ChatStore.setChatThreads', context: context);

  @override
  Future<dynamic> setChatThreads(List<ChatThread> newChatThreads) {
    return _$setChatThreadsAsyncAction
        .run(() => super.setChatThreads(newChatThreads));
  }

  late final _$getAllChatThreadsAsyncAction =
      AsyncAction('_ChatStore.getAllChatThreads', context: context);

  @override
  Future<dynamic> getAllChatThreads() {
    return _$getAllChatThreadsAsyncAction.run(() => super.getAllChatThreads());
  }

  late final _$updateChatThreadAsyncAction =
      AsyncAction('_ChatStore.updateChatThread', context: context);

  @override
  Future<dynamic> updateChatThread(ChatThread chatThread) {
    return _$updateChatThreadAsyncAction
        .run(() => super.updateChatThread(chatThread));
  }

  late final _$deleteChatThreadAsyncAction =
      AsyncAction('_ChatStore.deleteChatThread', context: context);

  @override
  Future<dynamic> deleteChatThread(int id) {
    return _$deleteChatThreadAsyncAction.run(() => super.deleteChatThread(id));
  }

  late final _$sendMessageAsyncAction =
      AsyncAction('_ChatStore.sendMessage', context: context);

  @override
  Future<dynamic> sendMessage(String content) {
    return _$sendMessageAsyncAction.run(() => super.sendMessage(content));
  }

  @override
  String toString() {
    return '''
success: ${success},
id: ${id},
chatThreads: ${chatThreads},
chatThreadsFuture: ${chatThreadsFuture},
updateChatThreadFuture: ${updateChatThreadFuture},
sendMessageFuture: ${sendMessageFuture},
isLoading: ${isLoading},
isLoadingChatThreads: ${isLoadingChatThreads},
isUpdatingChatThread: ${isUpdatingChatThread}
    ''';
  }
}
