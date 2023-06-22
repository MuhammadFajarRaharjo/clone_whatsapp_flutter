import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/helpers/show_alert_dialog.dart';
import 'package:whatsapp_flutter/common/utils/pallets.dart';

import '../../../common/models/user_model.dart';
import '../../../common/widgets/chat_list_tile.dart';

class PhoneContactListTile extends StatelessWidget {
  const PhoneContactListTile({
    super.key,
    required this.phoneContact,
    required this.indexEqualLength,
  });

  final UserModel phoneContact;
  final bool indexEqualLength;

  void _openSMSApp(String phoneNumber, BuildContext context) async {
    Uri uri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {
        'body': Uri.encodeComponent(
            'Ayo chat di WhatsApp, aplikasi yang cepat, sederhana, dan aman untuk berkirim pesan dan melakukan panggilan secara gratis. Dapatkan di https://whatsapp.com/dl/'),
      },
    );

    if (!await launchUrl(uri)) {
      // ignore: use_build_context_synchronously
      showAlertDialog(
        context: context,
        message: "Tidak dapat membuka aplikasi pesan",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (indexEqualLength)
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
          onTap: () => _openSMSApp(phoneContact.phoneNumber, context),
          title: phoneContact.name,
          leadingImage: phoneContact.profileImageUrl.isNotEmpty
              ? CachedNetworkImageProvider(phoneContact.profileImageUrl)
              : null,
          trailing: TextButton(
            onPressed: () => _openSMSApp(phoneContact.phoneNumber, context),
            style: TextButton.styleFrom(foregroundColor: Pallets.darkGreen),
            child: const Text('INVITE'),
          ),
        ),
        // ListTile(
        //   onTap: () => _openSMSApp(phoneContact.phoneNumber, context),
        //   contentPadding: const EdgeInsets.symmetric(vertical: 10)
        //       .copyWith(left: 20, right: 10),
        //   leading: CircleAvatar(
        //     radius: 20,
        //     foregroundImage: phoneContact.profileImageUrl.isNotEmpty
        //         ? CachedNetworkImageProvider(phoneContact.profileImageUrl) as ImageProvider
        //         : const AssetImage(
        //             Assets.assetsImagesEmptyProfilePicture,
        //           ),
        //   ),
        //   dense: true,
        //   title: Text(
        //     phoneContact.name,
        //     style: const TextStyle(
        //       fontWeight: FontWeight.w600,
        //       fontSize: 16,
        //     ),
        //   ),
        //   trailing: TextButton(
        //     onPressed: () => _openSMSApp(phoneContact.phoneNumber, context),
        //     style: TextButton.styleFrom(foregroundColor: Pallets.darkGreen),
        //     child: const Text('INVITE'),
        //   ),
        // ),
      ],
    );
  }
}
