import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/user_controller.dart';
import 'package:shop/auth/fire_auth.dart';
class ProfileCreationResponse extends StatefulWidget {
  final data;
  final path;
  final  message;
  const ProfileCreationResponse({super.key, this.data, this.path,required this.message});
  @override
  State<ProfileCreationResponse> createState() =>
      _ProfileCreationResponseState();
}
class _ProfileCreationResponseState extends State<ProfileCreationResponse> {

  @override
  Widget build(BuildContext context) {
    print(widget.path);
    Get.find<UserController>().addData(widget.path, widget.data);
    return Scaffold(
      body: GetBuilder<UserController>(
        builder: (controller) {
          return controller.isPosted
              ? Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.message,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const Icon(
                  Icons.done_outlined,
                  size: 150,
                  color: Colors.green,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                    navigateTo();
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                    alignment: Alignment.center,
                    child:  const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          )
              : const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }

  navigateTo() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  const AuthGate(),
      ),
    );
  }
}
