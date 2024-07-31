import 'package:flutter/material.dart';
import 'package:shop/pages/forms/new_stock.dart';

class StockEntryForm extends StatelessWidget {
  final product;
  const StockEntryForm({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stock Entry'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 5.5),
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(children: [
                    Text('Product Name:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                    Text('Product Description:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),

                  ],),
                  Column(children: [
                     Text(product.descriptions.toString()),
                     Text(product.descriptions.toString()),

                  ],),


              ],),
            ),
            const Text('Stock Item'),
            NewStockForm(product:product),
          ],
        ),
      ),
    );
  }
}
