import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/product_controller.dart';
class ProductRegistration extends StatefulWidget {
  // final data;
  // final path;
  const ProductRegistration({super.key});
  @override
  State<ProductRegistration> createState() =>
      _ProductRegistrationState();
}

class _ProductRegistrationState extends State<ProductRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductController>(
        builder: (controller) {
          return controller.isPosted
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Registered successfully',
                        style: TextStyle(
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
                         // Navigator.pop(context);
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
