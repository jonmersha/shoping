import 'package:flutter/material.dart';
import 'package:shop/pages/forms/category_form.dart';
import 'package:shop/pages/forms/product_create.dart';
import 'package:shop/pages/products/product_list.dart';

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
              builder: (context) =>  ProductList(),//CreateProduct(category: widget.category),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 190,
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
