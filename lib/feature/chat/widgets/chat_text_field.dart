import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/utils/pallets.dart';
import 'package:whatsapp_flutter/common/widgets/my_icon_button.dart';

import '../controller/chat_controller.dart';

class ChatTextField extends ConsumerStatefulWidget {
  const ChatTextField({
    super.key,
    required this.reciverId,
    required this.chatController,
  });
  final String reciverId;
  final ScrollController chatController;

  @override
  ConsumerState<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends ConsumerState<ChatTextField> {
  late final TextEditingController chatController;
  bool isMessageIconEnable = false;
  double cardHeight = 0;

  sendTextMessage() async {
    if (isMessageIconEnable) {
      ref.read(chatControllerProvider).sendTextMessage(
            textMessage: chatController.text.trim(),
            reciverId: widget.reciverId,
            context: context,
          );
      setState(() {
        isMessageIconEnable = false;
      });
      chatController.clear();
    }
    await Future.delayed(const Duration(milliseconds: 100));
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      widget.chatController.animateTo(
        widget.chatController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void initState() {
    chatController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          alignment: Alignment.center,
          height: cardHeight,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: context.theme.chatTextFieldColor,
            borderRadius: BorderRadius.circular(15),
          ),
          curve: Curves.easeOut,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconWithBottomText(
                      backgroundColor: Colors.deepPurple,
                      icon: Icons.file_copy_rounded,
                      onPressesd: () {},
                      text: 'Dokumen',
                    ),
                    IconWithBottomText(
                      backgroundColor: Colors.red,
                      icon: Icons.camera_alt,
                      onPressesd: () {},
                      text: 'Kamera',
                    ),
                    IconWithBottomText(
                      backgroundColor: Colors.purple,
                      icon: Icons.photo,
                      onPressesd: () {},
                      text: 'Photo',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconWithBottomText(
                      backgroundColor: Colors.deepOrange,
                      icon: Icons.headphones_rounded,
                      onPressesd: () {},
                      text: 'Audio',
                    ),
                    IconWithBottomText(
                      backgroundColor: Colors.greenAccent.shade700,
                      icon: Icons.location_on,
                      onPressesd: () {},
                      text: 'Lokasi',
                    ),
                    IconWithBottomText(
                      backgroundColor: Colors.blue,
                      icon: Icons.person,
                      onPressesd: () {},
                      text: 'Kontak',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: context.theme.chatTextFieldColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: MyIconButton(
                        icon: Theme.of(context).brightness == Brightness.dark
                            ? Icons.emoji_emotions
                            : Icons.emoji_emotions_outlined,
                        iconColor: context.theme.greyColor,
                        iconSize: 25,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: chatController,
                        onChanged: (value) {
                          value.isEmpty
                              ? setState(() => isMessageIconEnable = false)
                              : setState(() => isMessageIconEnable = true);
                        },
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Ketik Pesan",
                          hintStyle: TextStyle(color: Pallets.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RotatedBox(
                            quarterTurns: 45,
                            child: MyIconButton(
                              icon: cardHeight == 0
                                  ? Icons.attach_file
                                  : Icons.close,
                              iconColor: context.theme.greyColor,
                              iconSize: 25,
                              onPressed: () => setState(() => cardHeight == 0
                                  ? cardHeight = 220
                                  : cardHeight = 0),
                            ),
                          ),
                          if (!isMessageIconEnable)
                            MyIconButton(
                              icon: Icons.camera_alt,
                              iconColor: context.theme.greyColor,
                              iconSize: 25,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5),
            MyIconButton(
              icon: isMessageIconEnable ? Icons.send : Icons.mic,
              background: Pallets.green,
              iconColor: Colors.white,
              onPressed: sendTextMessage,
            ),
            const SizedBox(width: 5),
          ],
        ),
      ],
    );
  }
}

class IconWithBottomText extends StatelessWidget {
  const IconWithBottomText({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.onPressesd,
    required this.text,
  });
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onPressesd;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyIconButton(
          icon: icon,
          onPressed: onPressesd,
          minWidth: 50,
          iconColor: Colors.white,
          background: backgroundColor,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(color: context.theme.greyColor),
        )
      ],
    );
  }
}
