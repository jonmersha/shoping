import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final category;

  const ProductCard({super.key, required this.category});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void _increaseProgress() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 5.0,
      child: GestureDetector(
        onTap: (){

        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 190,
              //width: ,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                    AssetImage('images/category/${widget.category.imagename}'),
                    fit: BoxFit.cover,
                  )),
            ),
            Text(
              widget.category.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              widget.category.description,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 20.0),

            Row(children: [
              Text('${12} total  items in this category',style: const TextStyle(
                fontSize: 18.0,
              )),
            ],),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
