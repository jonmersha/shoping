import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/category_controller.dart';
import 'package:shop/RemoteService/controller/product_controller.dart';
import 'package:shop/pages/components/cards/category_card.dart';
import 'package:shop/pages/components/cards/product_card.dart';
import 'package:shop/pages/forms/category_form.dart';
import 'package:shop/utils/app_constants.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key,});
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().getList('$PRODUCT/get');
    return Scaffold(
      body: GetBuilder<ProductController>(
        builder: (controller) {
          return controller.isLoaded
              ? ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return  ProductCard(product: controller.list[index],);
              })
              : const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateCategory(),
            ),
          );
        },
        tooltip: 'Add New Category',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
