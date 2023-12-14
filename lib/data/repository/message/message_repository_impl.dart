import 'dart:async';
import 'package:boilerplate/data/local/datasources/message/message_datasource.dart';
import 'package:boilerplate/data/network/apis/message/message_api.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/domain/entity/message/message.dart';
import 'package:boilerplate/domain/repository/message/message_repository.dart';

class MessageRepositoryImpl extends MessageRepository {
  // data source object
  final MessageDataSource _messageDataSource;

  // api objects
  final MessageApi _messageApi;

  // constructor
  MessageRepositoryImpl(this._messageApi, this._messageDataSource);

  // Post: ---------------------------------------------------------------------
  @override
  Future<Message> sendMessage(List<Message> messages) async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _messageApi.sendMessage(messages).then((value) {
      return value;
    }).catchError((error) => throw error);
  }

  @override
  Future<ChatThread> getChatThread(int id) => _messageDataSource
      .getChatThreadById(id)
      .then((id) => id)
      .catchError((error) => throw error);

  @override
  Future<int> saveChatThread(ChatThread chatThread) => _messageDataSource
      .insertChatThread(chatThread)
      .then((id) => id)
      .catchError((error) => throw error);
}
