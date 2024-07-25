import 'package:flutter/material.dart';
import 'package:shop/pages/products/product_list.dart';
import 'package:shop/utils/app_constants.dart';

class CategoryCard extends StatefulWidget {
  final category;
  const CategoryCard({super.key, required this.category});
  @override
  _CategoryCardState createState() => _CategoryCardState();
}
class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 5.0,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>  ProductList(category: widget.category,),//CreateProduct(category: widget.category),
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
