import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/models/user_model.dart';
import 'package:whatsapp_flutter/common/routes/routes.dart';
import 'package:whatsapp_flutter/common/widgets/my_icon_button.dart';
import 'package:whatsapp_flutter/constants/assets.dart';
import 'package:whatsapp_flutter/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_flutter/feature/chat/widgets/chat_text_field.dart';

import '../../../common/helpers/last_seen_message.dart';
import '../widgets/messages.dart';

class ChatPage extends ConsumerWidget {
  ChatPage(this.user, {super.key});
  final UserModel user;
  final ScrollController chatController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.theme.chatBackgroundColor,
      appBar: appBarChat(context, ref),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.assetsImagesDoodleBg,
            fit: BoxFit.cover,
            color: context.theme.photoIconBgColor,
          ),
          Column(
            children: [
              Messages(user: user, chatController: chatController),

              // custom bottom TextField
              ChatTextField(
                reciverId: user.uid,
                chatController: chatController,
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar appBarChat(BuildContext context, WidgetRef ref) {
    return AppBar(
      foregroundColor: Colors.white,
      leadingWidth: 70,
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
        child: InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.arrow_back_rounded),
              CircleAvatar(
                radius: 18,
                backgroundImage: user.profileImageUrl != ''
                    ? CachedNetworkImageProvider(user.profileImageUrl)
                        as ImageProvider
                    : const AssetImage(Assets.assetsImagesEmptyProfilePicture),
                backgroundColor: context.theme.greyColor,
              ),
            ],
          ),
        ),
      ),
      titleSpacing: 0,
      centerTitle: false,
      title: titleAppBar(ref, context),
      actions: const [
        MyIconButton(icon: Icons.video_call),
        MyIconButton(icon: Icons.phone),
        MyIconButton(icon: Icons.more_vert),
      ],
    );
  }

  Widget titleAppBar(WidgetRef ref, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.profile,
        arguments: user,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name),
              ref.watch(getUserPresistenceStatusProvider(user.uid)).whenOrNull(
                        data: (data) => Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            data.active
                                ? "Online"
                                : lastSeenMessage(data.lastSeen),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ) ??
                  const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
