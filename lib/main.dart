import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/routes/routes.dart';
import 'package:whatsapp_flutter/common/utils/error_page.dart';
import 'package:whatsapp_flutter/common/utils/loading_page.dart';
import 'package:whatsapp_flutter/common/utils/themes.dart';
import 'package:whatsapp_flutter/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_flutter/feature/home/page/home_page.dart';
import 'package:whatsapp_flutter/feature/welcome/pages/welcome_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      title: 'WhatsaApp Clone Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeMode.system,
      // home: const WelcomePage(),
      home: ref.watch(getCurrentUserProvider).when(
            // skipLoadingOnReload: true,
            data: (user) {
              FlutterNativeSplash.remove();
              if (user != null) {
                return const HomePage();
              }
              return const WelcomePage();
            },
            error: (error, stackTrace) => ErrorPage(message: error.toString()),
            loading: () => const LoadingPage(),
          ),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
