import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/user_controller.dart';
import 'package:shop/components/UserCard.dart';
import 'package:shop/pages/forms/ProductForms.dart';
import 'package:shop/pages/forms/product_create.dart';
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
      home: const Home(title: 'Personal Objectives '),
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
    Get.find<UserController>().getList('$STOCKS/get');
    return Scaffold(
      body: GetBuilder<UserController>(
        builder: (controller) {
          return controller.isLoaded
              ? ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return  UserView(user: controller.list[index],);
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
              builder: (context) => const CreateProduct(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
