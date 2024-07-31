// import 'package:shop/apps/todo/customer_color.dart';
// import 'package:learn/apps/todo/presentation/pages/todo_home.dart';
// import 'package:learn/security/auth_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/pages/security/auth_data.dart';
import 'package:shop/utils/app_colors.dart';

Widget loginButton(String title, String email, String password) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: GestureDetector(
      onTap: () {
        // print('The Email Ids${email}');
        AuthenticationRemote().login(email, password);
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: custom_green, borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget signUpButton(
    String title, String email, String password, String confirmPassword) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: GestureDetector(
      onTap: () {
        AuthenticationRemote()
            .register(email.trim(), password.trim(), confirmPassword.trim());
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: custom_green, borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget textField(TextEditingController controller, FocusNode focusedNode,
    String type, IconData iconData) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular((15)),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusedNode,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
            prefixIcon: Icon(
              iconData,
              color: focusedNode.hasFocus
                  ? const Color(0xff18DAA3)
                  : const Color(0xffc5c5c5),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: type,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: Color(0xffc5c5c5), width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: custom_green, width: 2.0))),
      ),
    ),
  );
}

Widget images() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/common/lock.png'), fit: BoxFit.cover)),
    ),
  );
}

Widget googleLogin(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () async {
        User? user = await AuthenticationRemote().googleSignIn();
        if (user != null) {
          //Navigator.push(
           // context,
           // MaterialPageRoute(builder: (context) => const TodoHome()),
         // );
        }
        // print(user?.displayName.toString());
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/common/google.png'), fit: BoxFit.cover),
        ),
      ),
    ),
  );
}

Widget faceBookLogin() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/common/facebook.png'), fit: BoxFit.cover),
      ),
    ),
  );
}

Widget linkedInLogin() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/common/linkedin.png'),
              fit: BoxFit.cover),
        ),
      ),
    ),
  );
}
