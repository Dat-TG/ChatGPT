import 'package:boilerplate/di/service_locator.dart';
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
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('ChatGPT'),
      actions: [
        Observer(builder: (context) {
          return IconButton(
            icon: FaIcon(FontAwesomeIcons.penToSquare),
            splashRadius: 20,
            iconSize: 20,
            disabledColor: Colors.grey,
            onPressed: _chatStore.id > 0
                ? () {
                    _chatStore.setChatThreadId(-1);
                  }
                : null,
          );
        }),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.ellipsisVertical),
          splashRadius: 20,
          iconSize: 20,
          onPressed: () {},
        ),
      ],
    );
  }
}
