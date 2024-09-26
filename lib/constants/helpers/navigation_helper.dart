import 'package:flutter/material.dart';

nextScreen(BuildContext context, screenName) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screenName,
    ),
  );
}

nextScreenReplace(BuildContext context, screenName) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => screenName,
    ),
  );
}
