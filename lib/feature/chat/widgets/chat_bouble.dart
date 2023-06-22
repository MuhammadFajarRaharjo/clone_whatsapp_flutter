import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';

import '../../../common/models/message_model.dart';

class ChatBouble extends StatelessWidget {
  const ChatBouble({
    super.key,
    required this.isSender,
    required this.haveNip,
    required this.message,
  });

  final bool isSender;
  final bool haveNip;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4).copyWith(
        left: isSender
            ? MediaQuery.of(context).size.width * 0.2
            : haveNip
                ? 10
                : 18,
        right: isSender
            ? haveNip
                ? 10
                : 18
            : MediaQuery.of(context).size.width * 0.2,
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: ClipPath(
        clipper: haveNip
            ? UpperNipMessageClipperTwo(
                isSender ? MessageType.send : MessageType.receive,
                nipWidth: 8,
                bubbleRadius: 10,
              )
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8).copyWith(
            left: haveNip
                ? isSender
                    ? 10
                    : 20
                : 10,
            right: haveNip
                ? 20
                : isSender
                    ? 12
                    : 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(haveNip ? 0 : 10),
            color: isSender
                ? context.theme.senderChatCardBg
                : context.theme.reciverChatCardBg,
            boxShadow: const [BoxShadow(color: Colors.black38)],
          ),
          child: Stack(
            children: [
              Text(
                "${message.textMessage}         ",
                style: const TextStyle(fontSize: 16),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Text(
                  DateFormat.Hm().format(
                    DateTime.fromMillisecondsSinceEpoch(message.timeSent),
                  ),
                  style: const TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
