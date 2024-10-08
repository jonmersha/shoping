import 'package:flutter/material.dart';
import 'package:shop/pages/products/product_list.dart';
import 'package:shop/utils/app_constants.dart';

class StockCard extends StatefulWidget {
  final category;
  const StockCard({super.key, required this.category});
  @override
  _StockCardState createState() => _StockCardState();
}
class _StockCardState extends State<StockCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 5.0,
      child: GestureDetector(
        onTap: (){
          //merchant product by category Path
          late String path='$PRODUCT/${widget.category.id}/1';
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>  ProductList(path:path,category: widget.category,),//CreateProduct(category: widget.category),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 190,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage('$imagePath/${widget.category.imageName}'),
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
            const Row(children: [
              Text('${12} total  items in this category',style: TextStyle(
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
