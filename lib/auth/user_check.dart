import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/user_controller.dart';
import 'package:shop/utils/app_constants.dart';

class CheckUser extends StatefulWidget {
  final email;
  const CheckUser({super.key, this.email});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {

  @override
  Widget build(BuildContext context) {
    Get.find<UserController>().getList('$ADD/${widget.email.toString()}',);

    return const Placeholder();
  }
}
