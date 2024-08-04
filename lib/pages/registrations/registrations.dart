import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/category_controller.dart';
import 'package:shop/utils/app_constants.dart';
class RegistrationPage extends StatefulWidget {
  final data;
  final path;
  final  message;
  const RegistrationPage({super.key, this.data, this.path,required this.message});
  @override
  State<RegistrationPage> createState() =>
      _RegistrationPageState();
}
class _RegistrationPageState extends State<RegistrationPage> {

  @override
  Widget build(BuildContext context) {
    print(widget.path);
    Get.find<CategoryController>().addData(widget.path, widget.data);
    Get.find<CategoryController>().getList('$DATA/0/$merchant_id');

    return Scaffold(
      body: GetBuilder<CategoryController>(
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
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30)),
                          alignment: Alignment.center,
                          child:  const Text(
                            'Go To Home',
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
}
