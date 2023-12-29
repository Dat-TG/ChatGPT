import 'package:boilerplate/core/widgets/chat_input.dart';
import 'package:boilerplate/core/widgets/typing_indicator.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/new_chat/store/new_chat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  NewChatStore _newChatStore = getIt<NewChatStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return _newChatStore.isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 56,
                          right: 14,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 5,
                                ),
                                child: Text(
                                  DateFormat(null, 'en')
                                      .format(_newChatStore.userMessage.time),
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16, bottom: 16),
                                child: Text(
                                  _newChatStore.userMessage.message.content,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const TypingIndicator(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ChatInput(
                    onSend: _newChatStore.sendMessage,
                  ),
                ),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Center(
                    child: Transform.translate(
                      offset: Offset(0, -20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/logo.svg',
                              semanticsLabel: 'ChatGPT logo',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'How can I help you today?',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ChatInput(
                    onSend: _newChatStore.sendMessage,
                  ),
                ),
              ],
            );
    });
  }
}
