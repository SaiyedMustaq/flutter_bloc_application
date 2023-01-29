import 'package:flutter/material.dart';

// ignore: camel_case_types
class navigatorApp {
  void pushPage(BuildContext context, Widget page) {
    Navigator.of(context).pop(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pushRemoveUntil(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }
}
