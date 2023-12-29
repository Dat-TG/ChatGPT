import 'package:boilerplate/core/widgets/change_chat_thread_name_dialog.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/presentation/chat_screen/store/chat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ChatThreadWidget extends StatefulWidget {
  final String name;
  final int id;
  final VoidCallback onTap;
  const ChatThreadWidget({
    Key? key,
    required this.name,
    required this.onTap,
    required this.id,
  }) : super(key: key);

  @override
  State<ChatThreadWidget> createState() => _ChatThreadWidgetState();
}

class _ChatThreadWidgetState extends State<ChatThreadWidget> {
  ChatStore _chatStore = getIt<ChatStore>();

  Future<void> _showDeleteConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Prevents dismissing the dialog on outside tap
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this chat thread?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform deletion logic here
                // For example, you might call a function to delete the chat thread
                // deleteChatThread();
                int currentId = _chatStore.id;
                if (currentId == widget.id) {
                  _chatStore.setChatThreadId(-1);
                }
                _chatStore.deleteChatThread(widget.id);
                Navigator.of(context).pop(); // Close the dialog after deletion
              },
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        final offset = details.globalPosition;
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            offset.dx,
            offset.dy,
            MediaQuery.of(context).size.width - offset.dx,
            MediaQuery.of(context).size.height - offset.dy,
          ),
          items: [
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.edit_outlined),
                title: Text('Rename'),
              ),
              value: 'rename',
            ),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.delete_outline),
                title: Text('Delete'),
              ),
              value: 'delete',
            ),
          ],
          elevation: 8.0,
        ).then((value) {
          ChatThread chatThread = _chatStore.chatThreads
              .firstWhere((element) => element.id == widget.id);
          if (value == 'rename') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ChangeChatThreadNameDialog(
                  chatThread: chatThread,
                );
              },
            );
            // Handle edit option
          } else if (value == 'delete') {
            // Handle delete option
            _showDeleteConfirmation(context);
          }
        });
      },
      child: Observer(builder: (context) {
        return ListTile(
          tileColor: _chatStore.id == widget.id ? Colors.grey[700] : null,
          textColor: _chatStore.id == widget.id ? Colors.white : null,
          title: Text(widget.name),
          onTap: () {
            widget.onTap();
          },
        );
      }),
    );
  }
}
