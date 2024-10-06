import 'package:flutter/material.dart';
import 'package:shop/pages/forms/image_upload.dart';
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
        onTap: () {
          //merchant product by category Path
          late String path = '$PRODUCT/${widget.category.id}/1';
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductList(
                path: path,
                category: widget.category,
              ), //CreateProduct(category: widget.category),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              height: 190,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage('$imagePath/${widget.category.imageName}'),
                fit: BoxFit.cover,
              )),
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),

                    child: InkWell(
                      onTap: (){
                        late String path = '/shopping/upload/category/${widget.category.id}';
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ImageUpload(
                              path: path,

                            ), //CreateProduct(category: widget.category),
                          ),
                        );

                      },

                        child: const Icon(Icons.edit)))],),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.category.name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.category.description,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
