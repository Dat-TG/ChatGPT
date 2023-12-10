import 'package:boilerplate/core/widgets/chat_input.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Message {
  final String content;
  final bool isGPT;
  final DateTime createdAt;

  Message({
    required this.content,
    required this.isGPT,
    required this.createdAt,
  });
}

class ChatScreen extends StatefulWidget {
  final String chatThreadId;
  const ChatScreen({super.key, required this.chatThreadId});

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

  List<Message> messages = [
    Message(
        content: 'How can I help you?', isGPT: true, createdAt: DateTime.now()),
    Message(
        content: 'I want to learn about Flutter',
        isGPT: false,
        createdAt: DateTime.now()),
    Message(
        content: 'What do you want to learn about Flutter?',
        isGPT: true,
        createdAt: DateTime.now()),
    Message(
        content: 'I want to learn about Bloc',
        isGPT: false,
        createdAt: DateTime.now()),
    Message(
        content: 'What do you want to learn about Bloc?',
        isGPT: true,
        createdAt: DateTime.now()),
    Message(
        content: 'I want to learn about Bloc',
        isGPT: false,
        createdAt: DateTime.now()),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            controller: _controller,
            itemCount: messages.length + 1,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              // if (index == state.messages?.length) {
              //   return (state is! ConversationDone)
              //       ? Center(
              //           child: SizedBox(
              //             width: 30,
              //             height: 30,
              //             child: CircularProgressIndicator(
              //               strokeWidth: 1.5,
              //               color: Theme.of(context).primaryColor,
              //             ),
              //           ),
              //         )
              //       : const SizedBox();
              // }
              if (index == 0) {
                return CustomProgressIndicatorWidget();
              }
              return Container(
                padding: EdgeInsets.only(
                    left: (messages[index - 1].isGPT) ? 14 : 56,
                    right: (messages[index - 1].isGPT) ? 56 : 14,
                    top: 10,
                    bottom: 10),
                child: Column(
                  crossAxisAlignment: (messages[index - 1].isGPT)
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    if (index - 1 == showTimeAtIndex)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 5,
                          ),
                          child: Text(
                            DateFormat(null, 'en')
                                .format(messages[index - 1].createdAt),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      ),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        setState(() {
                          if (showTimeAtIndex != index - 1) {
                            showTimeAtIndex = index - 1;
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
                              color: (messages[index - 1].isGPT)
                                  ? Colors.grey.shade300
                                  : Theme.of(context).colorScheme.primary),
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 16),
                          child: Text(
                            messages[index - 1].content,
                            style: TextStyle(
                                color: (messages[index - 1].isGPT)
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
          ),
        ),
        ChatInput(onSend: () {}),
      ],
    );
  }
}
