import 'package:boilerplate/core/widgets/chat_thread.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/chat_screen/store/chat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  ChatStore _chatStore = getIt<ChatStore>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.penToSquare,
              size: 20,
            ),
            title: Text('New chat'),
            minLeadingWidth: 10,
            onTap: () {
              _chatStore.setChatThreadId(-1);
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 1,
          ),
          Expanded(
            child: Observer(builder: (context) {
              if (_chatStore.isLoadingChatThreads) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.zero,
                children: _chatStore.chatThreads
                    .map(
                      (e) => ChatThreadWidget(
                        name: e.subject,
                        id: e.id,
                        onTap: () {
                          _chatStore.setChatThreadId(e.id);
                          Navigator.pop(context);
                        },
                      ),
                    )
                    .toList(),
              );
            }),
          ),
          Divider(
            height: 1,
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.solidStar,
              size: 20,
            ),
            title: Text('Lê Công Đắt'),
            minLeadingWidth: 10,
          ),
        ],
      ),
    );
  }
}
