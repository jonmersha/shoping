import 'package:shop/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Well Come back!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),
                const Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.amber,
                ),




InkWell(
  onTap: (){
    AuthService().googleSignIn();
  },
  child: Container(
    width: 200,
    height: 40,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.green.shade200
    ),
    child: Text('Login with google'),),
)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
