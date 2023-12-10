import 'package:boilerplate/core/widgets/main_app_bar.dart';
import 'package:boilerplate/core/widgets/main_drawer.dart';
import 'package:boilerplate/presentation/chat_screen/chat_screen.dart';
import 'package:boilerplate/presentation/new_chat/new_chat_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? chatThreadId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainAppBar(),
      ),
      drawer: MainDrawer(setChatThreadId: (id) {
        setState(() {
          chatThreadId = id;
        });
        Navigator.pop(context);
      }),
      body: chatThreadId != null
          ? ChatScreen(chatThreadId: chatThreadId!)
          : NewChatScreen(),
    );
  }
}
