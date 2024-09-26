import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import 'auth/login_screen.dart';
import 'news_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    userLoggedIn();
    super.initState();
  }

  bool isUserLoggedIn = false;

  Future<void> userLoggedIn() async {
    final authProvider = context.read<AuthProvider>();
    final res = await authProvider.isUserLoggedIn();
    setState(() {
      isUserLoggedIn = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isUserLoggedIn == true ? const NewsScreen() : const LoginScreen(),
    );
  }
}
