import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/category_controller.dart';
import 'package:shop/auth/fire_auth.dart';
import 'package:shop/pages/components/cards/category_card.dart';
import 'package:shop/pages/components/header.dart';
import 'package:shop/pages/forms/category_form.dart';
import 'package:shop/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shop',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthGate(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.light(), //fromSeed(seedColor: Colors.white24),
        // cardColor: Colors.white,
        useMaterial3: true,
      ),
      // home: const Home(title: 'Product Category'),
    );
  }
}

class Home extends StatefulWidget {
  final AsyncSnapshot<User?> snapshot;
  const Home({super.key,required this.snapshot});

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    Get.find<CategoryController>().getList('$DATA/0');
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             HeaderSection(fullName:'${widget.snapshot.data!.displayName}',imageUrl: widget.snapshot.data!.photoURL,),
            Flexible(
              child: GetBuilder<CategoryController>(
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateCategory(),
            ),
          );
        },
        tooltip: 'Add new category',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
