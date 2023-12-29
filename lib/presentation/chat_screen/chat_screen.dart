import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:boilerplate/core/widgets/chat_input.dart';
import 'package:boilerplate/core/widgets/typing_indicator.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/message/message.dart';
import 'package:boilerplate/presentation/chat_screen/store/chat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int showTimeAtIndex = -1;
  final ScrollController _controller = ScrollController();

  void scrollToBottom() {
    if (_controller.hasClients) {
      _controller.jumpTo(
        _controller.position.maxScrollExtent,
      );
    }
  }

  void scrollToPosition(double position) {
    if (_controller.hasClients) {
      _controller.jumpTo(
        position,
      );
    }
  }

  ChatStore _chatStore = getIt<ChatStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Observer(builder: (context) {
            if (_chatStore.id == -1) {
              return const Center(
                child: Text('Select a chat to start'),
              );
            }
            final int chatThreadIndex = _chatStore.chatThreads
                .indexWhere((element) => element.id == _chatStore.id);
            if (_chatStore.chatThreads[chatThreadIndex].messages.isEmpty) {
              return const Center(
                child: Text('No messages yet'),
              );
            }
            return ListView.builder(
              controller: _controller,
              itemCount:
                  _chatStore.chatThreads[chatThreadIndex].messages.length +
                      (_chatStore.isLoading ? 1 : 0),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                if (index > 0 &&
                    index ==
                        _chatStore
                            .chatThreads[chatThreadIndex].messages.length) {
                  return TypingIndicator();
                }
                return Container(
                  padding: EdgeInsets.only(
                    left: (_chatStore.chatThreads[chatThreadIndex]
                                .messages[index].message.role ==
                            Role.assistant)
                        ? 14
                        : 56,
                    right: (_chatStore.chatThreads[chatThreadIndex]
                                .messages[index].message.role ==
                            Role.assistant)
                        ? 56
                        : 14,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: (_chatStore.chatThreads[chatThreadIndex]
                                .messages[index].message.role ==
                            Role.assistant)
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      if (index == showTimeAtIndex)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 5,
                            ),
                            child: Text(
                              DateFormat(null, 'en').format(_chatStore
                                  .chatThreads[chatThreadIndex]
                                  .messages[index]
                                  .time),
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          setState(() {
                            if (showTimeAtIndex != index) {
                              showTimeAtIndex = index;
                            } else {
                              showTimeAtIndex = -1;
                            }
                          });
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (_chatStore.chatThreads[chatThreadIndex]
                                            .messages[index].message.role ==
                                        Role.assistant)
                                    ? Colors.grey.shade300
                                    : Theme.of(context).colorScheme.primary),
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 16),
                            child: ((index ==
                                        _chatStore.chatThreads[chatThreadIndex]
                                                .messages.length -
                                            1) &&
                                    (_chatStore.chatThreads[chatThreadIndex]
                                            .messages[index].message.role ==
                                        Role.assistant))
                                ? DefaultTextStyle(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    child: AnimatedTextKit(
                                      repeatForever: false,
                                      displayFullTextOnTap: true,
                                      isRepeatingAnimation: false,
                                      animatedTexts: [
                                        TyperAnimatedText(
                                          _chatStore
                                              .chatThreads[chatThreadIndex]
                                              .messages[index]
                                              .message
                                              .content,
                                          speed: Duration(milliseconds: 20),
                                        ),
                                      ],
                                      onTap: () {
                                        setState(() {
                                          if (showTimeAtIndex != index) {
                                            showTimeAtIndex = index;
                                          } else {
                                            showTimeAtIndex = -1;
                                          }
                                        });
                                      },
                                    ),
                                  )
                                : Text(
                                    _chatStore.chatThreads[chatThreadIndex]
                                        .messages[index].message.content,
                                    style: TextStyle(
                                        color: (_chatStore
                                                    .chatThreads[
                                                        chatThreadIndex]
                                                    .messages[index]
                                                    .message
                                                    .role ==
                                                Role.assistant)
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
        ChatInput(onSend: (String content) {
          _chatStore.sendMessage(content);
        }),
      ],
    );
  }
}
