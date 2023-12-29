import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/presentation/chat_screen/store/chat_store.dart';
import 'package:flutter/material.dart';

class ChangeChatThreadNameDialog extends StatefulWidget {
  final ChatThread chatThread;
  const ChangeChatThreadNameDialog({Key? key, required this.chatThread})
      : super(key: key);
  @override
  State<ChangeChatThreadNameDialog> createState() =>
      _ChangeChatThreadNameDialogState();
}

class _ChangeChatThreadNameDialogState
    extends State<ChangeChatThreadNameDialog> {
  final TextEditingController _nameController = TextEditingController();
  ChatStore _chatStore = getIt<ChatStore>();

  @override
  void initState() {
    _nameController.text = widget.chatThread.subject;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Change chat thread name'),
      content: TextField(
        controller: _nameController,
        decoration: InputDecoration(
          hintText: 'Name',
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String newName = _nameController.text;
            // Use newName as needed, e.g., save to database
            print('New name: $newName');
            _chatStore
                .updateChatThread(widget.chatThread.copyWith(subject: newName));
            Navigator.of(context).pop();
          },
          child: Text(
            'Save',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
