import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

/// Example for EmojiPickerFlutter
class ChatInput extends StatefulWidget {
  final Function onSend;
  const ChatInput({super.key, required this.onSend});

  @override
  ChatInputState createState() => ChatInputState();
}

class ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 66.0,
            color: Colors.transparent,
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        emojiShowing = !emojiShowing;
                      });
                    },
                    icon: Icon(
                      Icons.emoji_emotions,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                        controller: _controller,
                        style: Theme.of(context).textTheme.bodyLarge,
                        decoration: InputDecoration(
                          hintText: 'Message',
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                          contentPadding: const EdgeInsets.only(
                              left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        )),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        // send message
                        widget.onSend(_controller.text);
                        _controller.text = '';
                      },
                      icon: Icon(
                        Icons.send,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                )
              ],
            )),
        Offstage(
          offstage: !emojiShowing,
          child: SizedBox(
              height: 250,
              child: EmojiPicker(
                textEditingController: _controller,
                onBackspacePressed: _onBackspacePressed,
                config: Config(
                  columns: 7,
                  // Issue: https://github.com/flutter/flutter/issues/28894
                  emojiSizeMax: 32 *
                      (foundation.defaultTargetPlatform == TargetPlatform.iOS
                          ? 1.30
                          : 1.0),
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  gridPadding: EdgeInsets.zero,
                  initCategory: Category.RECENT,
                  bgColor: Theme.of(context).colorScheme.background,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  iconColor: Colors.grey,
                  iconColorSelected: Theme.of(context).colorScheme.primary,
                  backspaceColor: Theme.of(context).colorScheme.primary,
                  skinToneDialogBgColor: Colors.white,
                  skinToneIndicatorColor: Colors.grey,
                  enableSkinTones: true,
                  recentTabBehavior: RecentTabBehavior.RECENT,
                  recentsLimit: 28,
                  replaceEmojiOnLimitExceed: false,
                  noRecents: const Text(
                    'No Recents',
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                    textAlign: TextAlign.center,
                  ),
                  loadingIndicator: const SizedBox.shrink(),
                  tabIndicatorAnimDuration: kTabScrollDuration,
                  categoryIcons: const CategoryIcons(),
                  buttonMode: ButtonMode.MATERIAL,
                  checkPlatformCompatibility: true,
                ),
              )),
        ),
      ],
    );
  }
}
