import 'package:shop/auth/auth_service.dart';
import 'package:shop/widget/common/square_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  // void dialogBox(String message) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Scaffold(
  //           backgroundColor: Colors.grey[500],
  //           body: Center(
  //             child: SafeArea(
  //               child: Center(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     const Icon(
  //                       Icons.error_outline,
  //                       size: 100,
  //                       color: Colors.red,
  //                     ),
  //                     Text(
  //                       message,
  //                       style: const TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 25,
  //                           color: Colors.red),
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     GestureDetector(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Container(
  //                             width: 300,
  //                             alignment: Alignment.center,
  //                             padding: const EdgeInsets.all(10),
  //                             decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(25),
  //                                 color: Colors.black),
  //                             child: const Text(
  //                               'Ok',
  //                               style:
  //                                   TextStyle(color: Colors.blue, fontSize: 25),
  //                             )))
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }



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
