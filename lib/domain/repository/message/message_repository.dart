import 'dart:async';

import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/domain/entity/message/message.dart';

abstract class MessageRepository {
  Future<ChatThread> getChatThread(int id);

  Future<Message> sendMessage(List<Message> messages);

  Future<int> saveChatThread(ChatThread chatThread);

  Future<List<ChatThread>> getAllChatThreads();
}
