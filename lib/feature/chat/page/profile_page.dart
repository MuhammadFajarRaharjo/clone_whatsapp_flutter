import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/models/user_model.dart';
import 'package:whatsapp_flutter/common/utils/pallets.dart';
import 'package:whatsapp_flutter/common/widgets/my_icon_button.dart';

import '../../../common/helpers/last_seen_message.dart';
import '../../../common/widgets/icon_list_tile.dart';
import '../widgets/card_profile.dart';
import '../widgets/icon_button_with_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage(this.user, {super.key});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBacgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverPersistDelegate(user),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CardProfile(
                  paddingTop: 0,
                  children: [
                    Text(user.name, style: const TextStyle(fontSize: 24)),
                    const SizedBox(height: 15),
                    Text(
                      user.phoneNumber,
                      style: TextStyle(
                        color: context.theme.greyColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "last seen ${lastSeenMessage(user.lastSeen)}",
                      style: TextStyle(color: context.theme.greyColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButtonWithText(
                          icon: Icons.phone,
                          text: "call",
                          onTap: () {},
                        ),
                        IconButtonWithText(
                          icon: Icons.video_call,
                          text: "Video",
                          onTap: () {},
                        ),
                        IconButtonWithText(
                          icon: Icons.search,
                          text: "Cari",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CardProfile(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(user.status)],
                ),
                const SizedBox(height: 15),
                CardProfile(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Media, taudan, dan dok"),
                        Row(
                          children: [
                            Text(
                              "128",
                              style: TextStyle(
                                color: context.theme.greyColor,
                              ),
                            ),
                            Icon(
                              size: 12,
                              Icons.arrow_forward_ios,
                              color: context.theme.greyColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CardProfile(
                  padding: EdgeInsets.zero,
                  children: [
                    IconListTile(
                      title: "Bisukan notifikasi",
                      icon: Icons.notifications,
                      onTap: () {},
                      trailing: Switch(
                        inactiveThumbColor: Pallets.grey,
                        activeColor: Pallets.green,
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    IconListTile(
                      title: "Notifikasi kustom",
                      icon: Icons.music_note,
                      onTap: () {},
                    ),
                    IconListTile(
                      title: "Tampilkan Media",
                      icon: Icons.image,
                      onTap: () {},
                    ),
                    IconListTile(
                      title: "Pesan berbintang",
                      icon: Icons.star,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CardProfile(
                  padding: const EdgeInsets.only(top: 15),
                  children: [
                    IconListTile(
                      title: "Enkripsi",
                      isThreeLine: true,
                      subtitle:
                          "Pesan dan panggilang terenkripsi secara end-to-end. Ketuk untuk memverifikasi.",
                      icon: Icons.lock,
                      onTap: () {},
                    ),
                    IconListTile(
                      title: "Pesan Sementara",
                      subtitle: "Mati",
                      icon: Icons.timer,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CardProfile(
                  padding: EdgeInsets.zero,
                  children: [
                    IconListTile(
                      title: "Blokir ${user.name}",
                      icon: Icons.block,
                      color: Colors.red,
                      textColor: Colors.red,
                      onTap: () {},
                    ),
                    IconListTile(
                      title: "Laporkan ${user.name}",
                      icon: Icons.thumb_down,
                      color: Colors.red,
                      textColor: Colors.red,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SliverPersistDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeaderHeight = 180;
  final double minHeaderHeight = kToolbarHeight + 35;
  final double maxImageSize = 130;
  final double minImageSize = 40;
  final UserModel user;

  SliverPersistDelegate(this.user);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final paddingTop = MediaQuery.of(context).viewPadding.top + 5;
    final percent = shrinkOffset / (maxHeaderHeight - 35);
    final percent2 = shrinkOffset / (maxHeaderHeight);
    final currentImageSize = (maxImageSize * (1 - percent)).clamp(
      minImageSize,
      maxImageSize,
    );

    final currentImagePosition =
        ((MediaQuery.of(context).size.width / 2 - 65) * (1 - percent))
            .clamp(minImageSize, maxImageSize);
    final collorAppButton =
        currentImagePosition < 80 ? Colors.white : Pallets.grey;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        color: Theme.of(context)
            .appBarTheme
            .backgroundColor!
            .withOpacity(percent2 * 2 < 1 ? percent2 * 2 : 1),
        child: Stack(
          children: [
            Positioned(
              top: paddingTop + 15,
              left: currentImagePosition + 50,
              child: Text(
                user.name,
                style: TextStyle(
                  color: Colors.white.withOpacity(percent2),
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              top: paddingTop,
              left: 0,
              child: BackButton(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : collorAppButton,
              ),
            ),
            Positioned(
              top: paddingTop,
              right: 0,
              child: MyIconButton(
                icon: Icons.more_vert,
                iconColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : collorAppButton,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).viewPadding.top,
              left: currentImagePosition,
              bottom: 0,
              child: Container(
                width: currentImageSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(user.profileImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeaderHeight;

  @override
  double get minExtent => minHeaderHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
