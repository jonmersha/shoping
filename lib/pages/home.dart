import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/category_controller.dart';
import 'package:shop/pages/components/cards/category_card.dart';
import 'package:shop/pages/forms/category_form.dart';
import 'package:shop/utils/app_constants.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),//fromSeed(seedColor: Colors.white24),
        // cardColor: Colors.white,
       useMaterial3: true,
      ),
      home: const Home(title: 'Product Category'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.find<CategoryController>().getList('$DATA/0');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Category'),
      ),
      body: GetBuilder<CategoryController>(
        builder: (controller) {
          return controller.isLoaded
              ? (controller.list.isEmpty)
                  ? const Center(
                      child: Text('Please Create New Category'),
                    )
                  : ListView.builder(
                      itemCount: controller.list.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          category: controller.list[index],
                        );
                      })
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateCategory(),
            ),
          );
        },
        tooltip: 'Add New Category',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
