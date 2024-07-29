import 'package:flutter/material.dart';
import 'package:shop/model/product.dart';

class ProductCard extends StatefulWidget {
  final  product;
  const ProductCard({super.key, required this.product});
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 5.0,
      child: GestureDetector(
        onTap: () {
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.product.productName.toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  widget.product.descriptions.toString(),
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),Text(
                  widget.product.quantity.toString(),
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Row(
                  children: [
                    Text('${12} total  items in this category',
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                  ],
                ),
                const SizedBox(height: 10.0),
              ],
            ),
            Column(
              children: [
                Container(

                  child: Text('Update'),),
                Container(child: Text('New Stock'),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
