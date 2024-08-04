import 'package:shop/main/widget/main/top_button.dart';
// import 'package:shop/widget/home/header_info.dart';
// import 'package:shop/widget/home/search_bar.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: const Column(
              children: [
                //HeaderInfo(),
               // MySearchBar(),
              ],
            ),
          ),
          const TopButtonContainer(),
          const SizedBox(
            height: 20,
          ),
           Container()
        ]),
      ),
    );
  }
}
