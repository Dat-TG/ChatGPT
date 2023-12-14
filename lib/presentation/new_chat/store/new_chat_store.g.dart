// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewChatStore on _NewChatStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_NewChatStore.isLoading'))
          .value;

  late final _$successAtom =
      Atom(name: '_NewChatStore.success', context: context);

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

  late final _$sendMessageFutureAtom =
      Atom(name: '_NewChatStore.sendMessageFuture', context: context);

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

  late final _$sendMessageAsyncAction =
      AsyncAction('_NewChatStore.sendMessage', context: context);

  @override
  Future<dynamic> sendMessage(String content) {
    return _$sendMessageAsyncAction.run(() => super.sendMessage(content));
  }

  @override
  String toString() {
    return '''
success: ${success},
sendMessageFuture: ${sendMessageFuture},
isLoading: ${isLoading}
    ''';
  }
}
