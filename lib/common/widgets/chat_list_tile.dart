import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';

import '../../constants/assets.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    this.trailing,
    this.leadingIcon,
    this.subtitle,
    required this.title,
    this.leadingImage,
    this.leadingColor,
    this.onTap,
  });
  final ImageProvider<Object>? leadingImage;
  final Widget? trailing;
  final IconData? leadingIcon;
  final String title;
  final String? subtitle;
  final Color? leadingColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 10)
          .copyWith(left: 20, right: 10),
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: leadingImage ??
            const AssetImage(Assets.assetsImagesEmptyProfilePicture),
        backgroundColor: leadingColor ?? context.theme.greyColor,
      ),
      dense: true,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing,
    );
  }
}
