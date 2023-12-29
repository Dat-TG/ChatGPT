import 'package:boilerplate/core/widgets/change_chat_thread_name_dialog.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/presentation/chat_screen/store/chat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
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

                _chatStore.setChatThreadId(-1);

                _chatStore.deleteChatThread(currentId);
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
    return Observer(builder: (context) {
      return AppBar(
        title: Text('ChatGPT'),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.penToSquare),
            splashRadius: 20,
            iconSize: 20,
            disabledColor: Colors.grey,
            onPressed: _chatStore.id > 0
                ? () {
                    _chatStore.setChatThreadId(-1);
                  }
                : null,
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.ellipsisVertical),
            splashRadius: 20,
            iconSize: 20,
            onPressed: _chatStore.id > 0
                ? () {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                        200,
                        80,
                        0,
                        0,
                      ),
                      items: [
                        PopupMenuItem(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.edit_outlined),
                            title: Text('Rename'),
                          ),
                          value: 'rename',
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.delete_outline),
                            title: Text('Delete'),
                          ),
                          value: 'delete',
                        ),
                      ],
                      elevation: 8.0,
                    ).then((value) {
                      ChatThread chatThread = _chatStore.chatThreads
                          .firstWhere((element) => element.id == _chatStore.id);
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
                  }
                : null,
          ),
        ],
      );
    });
  }
}
