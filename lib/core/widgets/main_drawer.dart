import 'package:boilerplate/core/widgets/chat_thread.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatelessWidget {
  final Function setChatThreadId;
  const MainDrawer({super.key, required this.setChatThreadId});

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
              setChatThreadId(null);
            },
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ChatThreadWidget(
                  name: 'GraphQL in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'REST API Explanation',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'Jitsi Meet in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'Websockets in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'ChatGPT Flutter App',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'GraphQL in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'REST API Explanation',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'Jitsi Meet in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'Websockets in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'GraphQL in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'REST API Explanation',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'Jitsi Meet in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'Websockets in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'ChatGPT Flutter App',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'GraphQL in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'REST API Explanation',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'Jitsi Meet in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
                ChatThreadWidget(
                  name: 'Websockets in Flutter',
                  onTap: () {
                    setChatThreadId('1');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
