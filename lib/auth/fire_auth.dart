//import 'package:shop/auth/login_or_register.dart';
//import 'package:shop/main/main_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/auth/login_or_register.dart';
import 'package:shop/auth/login_page.dart';
import 'package:shop/main/main_home.dart';
import 'package:shop/pages/home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Home(title:'Category');
        }
        return const LoginPage();
      },
    );
  }
}
