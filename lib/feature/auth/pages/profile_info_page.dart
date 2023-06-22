import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/helpers/show_alert_dialog.dart';
import 'package:whatsapp_flutter/common/widgets/my_elevated_button.dart';
import 'package:whatsapp_flutter/feature/auth/widgets/my_underline_text_field.dart';

import '../../../common/routes/routes.dart';
import '../../../common/utils/pallets.dart';
import '../../../common/widgets/my_icon_button.dart';
import '../../../common/widgets/short_h_bar.dart';
import '../controller/auth_controller.dart';

class ProfileInfoPage extends ConsumerStatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  ConsumerState<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends ConsumerState<ProfileInfoPage> {
  File? imageCamera;
  Uint8List? imageGallery;
  late final TextEditingController usernameController;

  // Modal Mottom sheet
  imagePickerTypeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ShortHBar(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Profile photo",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  MyIconButton(
                    icon: Icons.close,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Divider(
              color: context.theme.greyColor!.withOpacity(0.3),
              thickness: 1,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20)
                  .copyWith(bottom: 20),
              child: Row(
                children: [
                  imagePickerIcon(
                    context: context,
                    onPressed: getImageFromPickture,
                    icon: Icons.camera_alt_rounded,
                    text: "Camera",
                  ),
                  const SizedBox(width: 15),
                  imagePickerIcon(
                    context: context,
                    onPressed: () async {
                      final image = await Navigator.popAndPushNamed(
                        context,
                        Routes.imagePicker,
                      );
                      if (image == null) return;
                      setState(() {
                        imageGallery = image as Uint8List;
                        imageCamera = null;
                      });
                    },
                    icon: Icons.photo,
                    text: "Gallery",
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  imagePickerIcon({
    required BuildContext context,
    required VoidCallback onPressed,
    required IconData icon,
    required String text,
  }) {
    return Column(
      children: [
        MyIconButton(
          icon: icon,
          onPressed: onPressed,
          iconColor: Pallets.green,
          minWidth: 50,
          border: Border.all(
            color: context.theme.greyColor!.withOpacity(.2),
            width: 1,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(color: context.theme.greyColor),
        ),
      ],
    );
  }

  Future<void> getImageFromPickture() async {
    final image = await ref.watch(authControllerProvider).pickImageFromCamera();
    setState(() {
      imageCamera = image;
      imageGallery = null;
    });
  }

  void saveUser() {
    if (usernameController.text.isEmpty) {
      showAlertDialog(context: context, message: "Please provide a username");
    }
    if (imageGallery == null && imageCamera == null) {
      showAlertDialog(
        context: context,
        message: "Please select your image profile",
      );
    }
    ref.read(authControllerProvider).saveUserToFirebase(
          context: context,
          username: usernameController.text,
          profileImage: imageCamera ?? imageGallery,
          mounted: mounted,
        );
  }

  @override
  void initState() {
    usernameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text("Profile Info"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              "Please provide your name and an optional profile photo",
              textAlign: TextAlign.center,
              style: TextStyle(color: context.theme.greyColor),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: imagePickerTypeBottomSheet,
              child: CircleAvatar(
                foregroundImage: imageCamera != null || imageGallery != null
                    ? imageGallery != null
                        ? MemoryImage(imageGallery!)
                        : FileImage(imageCamera!) as ImageProvider
                    : null,
                radius: 50,
                backgroundColor: context.theme.photoIconBgColor,
                child: Padding(
                  padding: const EdgeInsets.only(right: 3, bottom: 3),
                  child: Icon(
                    Icons.add_a_photo,
                    size: 48,
                    color: context.theme.photoIconColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: MyUnderlineTextField(
                      controller: usernameController,
                      hintText: 'Type your name here',
                      textAlign: TextAlign.left,
                      autofocus: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: context.theme.greyColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyElevatedButton(
        text: 'NEXT',
        onPressed: saveUser,
        width: 90,
      ),
    );
  }
}
