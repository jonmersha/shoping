import 'package:flutter/material.dart';

class StockEntryList extends StatelessWidget {
  const StockEntryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stock Entry List'),),
      body: const Center(child: Text('Stock Entry List'),),
    );
  }
}
