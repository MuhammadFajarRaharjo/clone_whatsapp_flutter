import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/routes/routes.dart';

import '../../../common/models/user_model.dart';
import '../../../common/widgets/chat_list_tile.dart';

class FirebaseContactListTile extends StatelessWidget {
  const FirebaseContactListTile({
    super.key,
    required this.firebaseContact,
    required this.indexIsZero,
  });

  final UserModel firebaseContact;
  final bool indexIsZero;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (indexIsZero)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              "Contacts on WhatsApp",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: context.theme.greyColor,
              ),
            ),
          ),
        ChatListTile(
          onTap: () => Navigator.popAndPushNamed(
            context,
            Routes.chat,
            arguments: firebaseContact,
          ),
          title: firebaseContact.name,
          leadingImage: firebaseContact.profileImageUrl.isNotEmpty
              ? CachedNetworkImageProvider(firebaseContact.profileImageUrl)
              : null,
          subtitle:
              firebaseContact.status.isNotEmpty ? firebaseContact.status : null,
        ),
      ],
    );
  }
}
