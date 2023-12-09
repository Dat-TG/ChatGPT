import 'package:boilerplate/core/widgets/chat_thread.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

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
            onTap: () {},
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ChatThread(name: 'GraphQL in Flutter'),
                ChatThread(name: 'REST API Explanation'),
                ChatThread(name: 'Jitsi Meet in Flutter'),
                ChatThread(name: 'Websockets in Flutter'),
                ChatThread(name: 'ChatGPT Flutter App'),
                ChatThread(name: 'GraphQL in Flutter'),
                ChatThread(name: 'REST API Explanation'),
                ChatThread(name: 'Jitsi Meet in Flutter'),
                ChatThread(name: 'Websockets in Flutter'),
                ChatThread(name: 'GraphQL in Flutter'),
                ChatThread(name: 'REST API Explanation'),
                ChatThread(name: 'Jitsi Meet in Flutter'),
                ChatThread(name: 'Websockets in Flutter'),
                ChatThread(name: 'ChatGPT Flutter App'),
                ChatThread(name: 'GraphQL in Flutter'),
                ChatThread(name: 'REST API Explanation'),
                ChatThread(name: 'Jitsi Meet in Flutter'),
                ChatThread(name: 'Websockets in Flutter'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
