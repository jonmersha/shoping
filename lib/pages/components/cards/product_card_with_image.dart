import 'package:flutter/material.dart';


class ProductCardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Product Card')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProductCard(
            imageUrl: 'https://via.placeholder.com/150',
            productName: 'Product Name',
            productDescription: 'This is a description of the product.',
            productPopularity: 'Popularity: High',
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productDescription;
  final String productPopularity;

  ProductCard({
    required this.imageUrl,
    required this.productName,
    required this.productDescription,
    required this.productPopularity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            // child: Image.network(
            //   imageUrl,
            //   width: double.infinity,
            //   height: 150,
            //   fit: BoxFit.cover,
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(productDescription),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productPopularity,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Text('Sell'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Text('Add New'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Text('Show'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
