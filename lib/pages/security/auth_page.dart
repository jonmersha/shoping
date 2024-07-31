import 'package:flutter/material.dart';
import 'package:shop/auth/login_screen.dart';
import 'package:shop/auth/sign_up.dart';

class AuthPage extends StatefulWidget {
  final bool val;
  const AuthPage(this.val, {Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    // a=!a;
    return a ? LogInScreen(to) : SignUpScreen(to);
  }
}
