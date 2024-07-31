import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/category_controller.dart';
import 'package:shop/auth/fire_auth.dart';
import 'package:shop/pages/components/cards/category_card.dart';
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
        '/home': (context) => const Home(
              title: 'Product Category',
            ),
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
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    Get.find<CategoryController>().getList('$DATA/0');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.notifications,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            // InkWell(
            //     onTap: (){
            //       FirebaseAuth.instance.signOut();
            //     },
            //     child: Icon(
            //       height: 100,
            //       child: Text('Homera'),)),
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
      ),
    );
  }
}
