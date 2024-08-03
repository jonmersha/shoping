import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shop/RemoteService/controller/user_controller.dart';
import 'package:shop/RemoteService/data_provider.dart';
import 'package:shop/utils/app_constants.dart';

class CheckUser extends StatefulWidget {
  final String uid;

  const CheckUser({super.key, required this.uid});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    // Get.find<UserController>().getList(
    //   '$ADD/${widget.uid.toString()}',
   // );
    context.read<DataProvider>().fetchData('$BASE_URL$USER/${widget.uid.toString()}');
    print('$USER/${widget.uid.toString()}');
    return Scaffold(
      body: Consumer<DataProvider>(
        builder: ( context,  controller, child) {
          if(controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else{
            return const Center(child: Text('IS loaded'),);
          }
        }),
    );

    // FutureBuilder(
    //   future: Get.find<UserController>().getList(
    //     '$DATA/${widget.uid.toString()}',
    //   ),
    //   builder: (context, snapshot) {
    //     return Container(child: Text('is'),);
    //   });
  }
}
