import 'package:flutter/material.dart';
import 'package:shop/model/product.dart';
import 'package:shop/pages/forms/new_stock.dart';
import 'package:shop/pages/products/new_stock.dart';
import 'package:shop/pages/products/product_update.dart';
import 'package:shop/pages/products/stock_entry_list.dart';

class ProductCard extends StatefulWidget {
  final product;

  const ProductCard({super.key, required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),

      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      //elevation: 5.0,
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
              ),
              Text(
                widget.product.quantity.toString(),
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 20.0),
              const Row(
                children: [
                  Text('${12} total  items ',
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
          Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductUpdate()));
                  },
                  child: pressButton(text: 'Update')),
              SizedBox(height: 10),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewStockForm(product: widget.product,)));
                  },
                  child: pressButton(text: 'New Stock')),
              SizedBox(height: 10),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StockEntryList()));
                  },
                  child: pressButton(text: 'Show Entry')),
              SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}

class pressButton extends StatelessWidget {
  final text;

  const pressButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(15)),
      child: Text(
        this.text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }
}
