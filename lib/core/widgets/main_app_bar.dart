import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('ChatGPT'),
      actions: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.penToSquare),
          splashRadius: 20,
          iconSize: 20,
          onPressed: () {},
        ),
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
