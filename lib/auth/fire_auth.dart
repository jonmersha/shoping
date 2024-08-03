import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/auth/check_user.dart';
import 'package:shop/auth/login_page.dart';
import 'package:shop/auth/shop_profile.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //print(snapshot.data);
          //return Profile(data: snapshot,);
          //FutureBuilder(future: null, builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {  },);
      return CheckUser(uid:snapshot.data!.uid.toString());
          //return  Home(snapshot:snapshot);
        }
        return const LoginPage();
      },
    );
  }
}
