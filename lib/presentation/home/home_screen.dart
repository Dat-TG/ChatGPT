import 'package:boilerplate/core/widgets/main_app_bar.dart';
import 'package:boilerplate/core/widgets/main_drawer.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/chat_screen/chat_screen.dart';
import 'package:boilerplate/presentation/chat_screen/store/chat_store.dart';
import 'package:boilerplate/presentation/new_chat/new_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ChatStore _chatStore = getIt<ChatStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainAppBar(),
      ),
      drawer: MainDrawer(),
      body: Observer(builder: (context) {
        return _chatStore.id > 0 ? ChatScreen() : NewChatScreen();
      }),
    );
  }
}
