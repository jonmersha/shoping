import 'package:shop/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(
                  'Login...',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        );
      },
    );

  }

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
    //_showLoadingDialog( context);
    AuthService().googleSignIn(context);
    //Navigator.of(context).pop();

  },
  child: Container(
    width: 200,
    height: 40,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.green.shade200
    ),
    child: const Text('Login with google'),),
)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
