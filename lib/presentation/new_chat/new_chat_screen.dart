import 'package:boilerplate/core/widgets/chat_input.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/new_chat/store/new_chat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  NewChatStore _newChatStore = getIt<NewChatStore>();
  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}
