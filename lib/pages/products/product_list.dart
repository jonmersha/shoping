import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/product_controller.dart';
import 'package:shop/pages/components/cards/product_card.dart';
// import 'package:shop/pages/components/cards/product_card_with_image.dart';
import 'package:shop/pages/forms/product_create.dart';

class ProductList extends StatefulWidget {
  final  path;
  final  category;

  const ProductList({super.key, required this.path,required this.category});
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {

    Get.find<ProductController>().getList(widget.path);
    return Scaffold(
      appBar: AppBar(title:const Text('Product List')),
      body: GetBuilder<ProductController>(
        builder: (controller) {
          return controller.isLoaded
              ? (controller.list.isEmpty)?const Center(child: Text('No Products in this category please add one'),):ListView.builder(
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
              builder: (context) =>  CreateProduct(category: widget.category),
            ),
          );
        },
        tooltip: 'Add New Category',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
