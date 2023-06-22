import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/widgets/my_icon_button.dart';
import 'package:whatsapp_flutter/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_flutter/feature/home/page/call_home_page.dart';
import 'package:whatsapp_flutter/feature/home/page/chat_home_page.dart';
import 'package:whatsapp_flutter/feature/home/page/status_home_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  late Timer timer;

  updateUserPresence() {
    ref.read(authControllerProvider).updateUserPresence();
  }

  @override
  void initState() {
    updateUserPresence();
    tabController = TabController(length: 3, vsync: this);
    timer = Timer.periodic(
      const Duration(minutes: 1),
      (timer) => setState(() {}),
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 1,
        title: const Text("WhatsApp"),
        actions: [
          MyIconButton(icon: Icons.camera_alt_outlined, onPressed: () {}),
          MyIconButton(icon: Icons.search, onPressed: () {}),
          MyIconButton(icon: Icons.more_vert, onPressed: () {}),
        ],
        bottom: TabBar(
          controller: tabController,
          indicatorWeight: 3,
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          splashFactory: NoSplash.splashFactory,
          tabs: const [
            Tab(text: 'Chat'),
            Tab(text: 'Status'),
            Tab(text: 'Panggilan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          ChatHomePage(),
          StatusHomePage(),
          CallHomePage(),
        ],
      ),
    );
  }
}
