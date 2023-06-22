import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/models/user_model.dart';
import 'package:whatsapp_flutter/common/utils/error_page.dart';
import 'package:whatsapp_flutter/common/utils/loading_page.dart';
import 'package:whatsapp_flutter/common/utils/pallets.dart';

import '../../../common/widgets/my_icon_button.dart';
import '../../../common/widgets/chat_list_tile.dart';
import '../controller/contact_controller.dart';
import '../widgets/firebase_contact_list_tile.dart';
import '../widgets/phone_contact_list_tile.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Contact"),
            const SizedBox(height: 5),
            ref.watch(contactControllerProvider).when(
                  data: (contacts) => Text(
                    "${contacts[0].length + contacts[1].length} Contacts",
                    style: const TextStyle(fontSize: 12),
                  ),
                  error: (error, stackTrace) => const SizedBox(),
                  loading: () => const Text(
                    "Counting",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
          ],
        ),
        actions: [
          MyIconButton(icon: Icons.search, onPressed: () {}),
          MyIconButton(icon: Icons.more_vert, onPressed: () {}),
        ],
      ),
      body: ref.watch(contactControllerProvider).when(
            data: (contacs) {
              return ListView.builder(
                itemCount: contacs[0].length + contacs[1].length,
                itemBuilder: (context, index) {
                  late UserModel firebaseContact;
                  late UserModel phoneContact;

                  if (index < contacs[0].length) {
                    firebaseContact = contacs[0][index];
                  } else {
                    phoneContact = contacs[1][index - contacs[0].length];
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index == 0)
                        Column(
                          children: [
                            ChatListTile(
                              title: "New Group",
                              leadingColor: Pallets.darkGreen,
                              leadingIcon: Icons.group,
                            ),
                            ChatListTile(
                              title: "New Contact",
                              leadingColor: Pallets.darkGreen,
                              leadingIcon: Icons.person_add,
                              trailing: const MyIconButton(
                                  icon: Icons.qr_code_rounded),
                            ),
                          ],
                        ),
                      if (index < contacs[0].length)
                        FirebaseContactListTile(
                          firebaseContact: firebaseContact,
                          indexIsZero: index == 0,
                        )
                      else
                        PhoneContactListTile(
                          phoneContact: phoneContact,
                          indexEqualLength: index == contacs[0].length,
                        )
                    ],
                  );
                },
              );
            },
            error: (error, stackTrace) => ErrorPage(message: error.toString()),
            loading: () => const LoadingPage(),
          ),
    );
  }
}
