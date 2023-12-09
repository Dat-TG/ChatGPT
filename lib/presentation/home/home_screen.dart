import 'package:boilerplate/core/widgets/main_app_bar.dart';
import 'package:boilerplate/core/widgets/main_drawer.dart';
import 'package:boilerplate/presentation/new_chat/new_chat_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainAppBar(),
      ),
      drawer: MainDrawer(),
      body: NewChatScreen(),
    );
  }
}
