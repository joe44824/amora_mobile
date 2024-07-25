import 'package:amora_mobile_app/firebase_options.dart';
import 'package:amora_mobile_app/ui/pages/login/login_page.dart';
import 'package:amora_mobile_app/ui/pages/onboard/set_photo_page.dart';
import 'package:amora_mobile_app/utils/navigation/wrapper.dart';

import 'package:amora_mobile_app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
