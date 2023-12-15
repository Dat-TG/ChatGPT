import 'package:boilerplate/core/widgets/chat_thread.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/chat_screen/store/chat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatefulWidget {
  final Function setChatThreadId;
  const MainDrawer({super.key, required this.setChatThreadId});

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
              widget.setChatThreadId(null);
            },
          ),
          Expanded(
            child: Observer(builder: (context) {
              if (_chatStore.isLoadingChatThreads) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                padding: EdgeInsets.zero,
                children: _chatStore.chatThreads
                    .map(
                      (e) => ChatThreadWidget(
                        name: e.subject,
                        onTap: () {
                          _chatStore.setChatThreadId(e.id);
                        },
                      ),
                    )
                    .toList(),
              );
            }),
          ),
        ],
      ),
    );
  }
}
