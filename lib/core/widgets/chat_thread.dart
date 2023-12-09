import 'package:flutter/material.dart';

class ChatThread extends StatefulWidget {
  final String name;
  const ChatThread({Key? key, required this.name}) : super(key: key);

  @override
  State<ChatThread> createState() => _ChatThreadState();
}

class _ChatThreadState extends State<ChatThread> {
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
          if (value == 'rename') {
            // Handle edit option
          } else if (value == 'delete') {
            // Handle delete option
          }
        });
      },
      child: ListTile(
        title: Text(widget.name),
        onTap: () {},
      ),
    );
  }
}
