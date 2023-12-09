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
                ListTile(
                  title: Text('ChatGPT Flutter App'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('GraphQL in Flutter'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('REST API Explanation'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Jitsi Meet in Flutter'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Websockets in Flutter'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('ChatGPT Flutter App'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('GraphQL in Flutter'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('REST API Explanation'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Jitsi Meet in Flutter'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Websockets in Flutter'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('ChatGPT Flutter App'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('GraphQL in Flutter'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('REST API Explanation'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Jitsi Meet in Flutter'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Websockets in Flutter'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
