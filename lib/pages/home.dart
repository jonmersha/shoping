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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
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
    Get.find<CategoryController>().getList('$CATEGORY/get');
    return Scaffold(
      body: GetBuilder<CategoryController>(
        builder: (controller) {
          return controller.isLoaded
              ? ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return  CategoryCard(category: controller.list[index],);
                  })
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateCategory(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
