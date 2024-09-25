import 'package:flutter/material.dart';
import 'package:flutternews/app/providers/auth_provider.dart';
import 'package:flutternews/app/screens/news_screen.dart';
import 'package:flutternews/app/screens/signup_screen.dart';
import 'package:provider/provider.dart';

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
      child: isUserLoggedIn == true ? NewsScreen() : SignUpScreen(),
    );
  }
}
