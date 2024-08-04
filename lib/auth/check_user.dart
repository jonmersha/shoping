import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/user_controller.dart';
import 'package:shop/auth/shop_profile.dart';
import 'package:shop/pages/home.dart';
import 'package:shop/utils/app_constants.dart';

class CheckUser extends StatefulWidget {
  //final String uid;
  //final AsyncSnapshot<User?> userData;
  final User? user;

  const CheckUser({super.key, required this.user, });

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    //searching for the users on the system
    Get.find<UserController>().getList('$USER/${widget.user!.uid.toString()}');
    //Navigator.of(context).pop();

    return GetBuilder<UserController>(builder: (controller) {
      return controller.isLoaded
          ? ((controller.list.isEmpty)
              ? Profile(user: widget.user)
              : Home(
                  userModel: controller.list[0],
                  user: widget.user,
                ))
          : const Scaffold(body:  Center(child: CircularProgressIndicator()));
    });
  }
}
