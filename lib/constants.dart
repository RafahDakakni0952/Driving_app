import 'package:flutter/material.dart';

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        message,
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
      ),
      action: SnackBarAction(
        label: 'undo',
        onPressed: scaffold.hideCurrentSnackBar,
        disabledTextColor: Colors.purple,
        textColor: Colors.purple,
      ),
    ),
  );
}
