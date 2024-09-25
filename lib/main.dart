import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/app/screens/signup_screen.dart';
import 'package:flutternews/app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'app/providers/auth_provider.dart';
import 'app/providers/news_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(
            create: (_) => NewsProvider()..fetchRemoteConfig()),
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
