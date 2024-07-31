import 'package:flutter/material.dart';
import 'package:shop/pages/components/cards/product_card_with_image.dart';
import 'package:shop/pages/forms/new_stock.dart';
import 'package:shop/pages/forms/sold_product.dart';
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
    return Card(
      color: Colors.white,
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
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV4ZRdDLqwlbXdhzXzMboaQLeg92XUe9sHrw&s',
            width: double.infinity,
            //height: 150,
            fit: BoxFit.fitHeight,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.product.productName.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(widget.product.descriptions.toString()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${widget.product.quantity.toString()} ${widget.product.unitsOfMeasure} ',
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
        ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {

                },
                child: Text('update'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Text('New'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SoldProduct(product: widget.product,)));
                },
                child: Text('Sell'),
              ),
            ]

        )

      ]),
    );
    //   Container(
    //   // color: Colors.grey.shade200,
    //
    //   padding: const EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //       color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
    //
    //   margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    //   //elevation: 5.0,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Flexible(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               widget.product.productName.toString(),
    //               style: const TextStyle(
    //                 fontSize: 20.0,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 8.0,
    //             ),
    //             Text(
    //               widget.product.descriptions.toString(),
    //               style: const TextStyle(
    //                 fontSize: 18.0,
    //               ),
    //             ),
    //             Text(
    //               widget.product.quantity.toString(),
    //               style: const TextStyle(
    //                 fontSize: 18.0,
    //               ),
    //             ),
    //             const SizedBox(height: 20.0),
    //              Row(
    //               children: [
    //                 Text('${widget.product.quantity.toString()} ${widget.product.unitsOfMeasure} ',
    //                     style: const TextStyle(
    //                       fontSize: 18.0,
    //                     )),
    //               ],
    //             ),
    //             const SizedBox(height: 10.0),
    //           ],
    //         ),
    //       ),
    //       Column(
    //         //  mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           InkWell(
    //               onTap: () {
    //                 Navigator.of(context).push(MaterialPageRoute(
    //                     builder: (context) => ProductCardImage()));
    //               },
    //               child: const pressButton(text: 'Sell')),
    //           const SizedBox(height: 10),
    //           InkWell(
    //               onTap: () {
    //                 Navigator.of(context).push(MaterialPageRoute(
    //                     builder: (context) => NewStockForm(product: widget.product,)));
    //               },
    //               child: const pressButton(text: 'New')),
    //           const SizedBox(height: 10),
    //           InkWell(
    //               onTap: () {
    //                 Navigator.of(context).push(MaterialPageRoute(
    //                     builder: (context) => const StockEntryList()));
    //               },
    //               child: const pressButton(text: 'List')),
    //           const SizedBox(height: 10),
    //         ],
    //       )
    //     ],
    //   ),
    // );
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
      height: 60,
      width: 60,

      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(30)),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }
}
