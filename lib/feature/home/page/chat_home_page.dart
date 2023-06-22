import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/routes/routes.dart';
import 'package:whatsapp_flutter/common/utils/error_page.dart';
import 'package:whatsapp_flutter/common/utils/loading_page.dart';
import 'package:whatsapp_flutter/constants/assets.dart';

import '../../auth/controller/auth_controller.dart';
import '../../chat/controller/chat_controller.dart';

class ChatHomePage extends ConsumerWidget {
  const ChatHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(allLastMessageProvider).when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final user = ref
                      .watch(
                        getUserPresistenceStatusProvider(data[index].contactId),
                      )
                      .value;
                  return ListTile(
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.chat,
                      arguments: user,
                    ),
                    leading: CircleAvatar(
                      backgroundImage: const AssetImage(
                        Assets.assetsImagesEmptyProfilePicture,
                      ),
                      foregroundImage:
                          CachedNetworkImageProvider(data[index].profileUrl),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data[index].username),
                        Text(
                          DateFormat.Hm().format(data[index].timeSent),
                          style: TextStyle(
                            fontSize: 13,
                            color: context.theme.greyColor,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      data[index].lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) => ErrorPage(message: error.toString()),
            loading: () => const LoadingPage(),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.contact),
        child: const Icon(Icons.chat),
      ),
    );
  }
}
