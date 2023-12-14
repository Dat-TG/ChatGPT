import 'package:flutter/material.dart';

class ChatThreadWidget extends StatefulWidget {
  final String name;
  final VoidCallback onTap;
  const ChatThreadWidget({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  State<ChatThreadWidget> createState() => _ChatThreadWidgetState();
}

class _ChatThreadWidgetState extends State<ChatThreadWidget> {
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
        onTap: () {
          widget.onTap();
        },
      ),
    );
  }
}
