import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/regester.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          routes: {
            'LoginPage': (context) => const LoginScreen(),
            'Regester': (context) => const Regester(),
            ChatPage.id: (context) => const ChatPage()
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: 'LoginPage',
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
