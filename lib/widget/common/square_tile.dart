import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const SquareTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding:const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
              border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            imagePath,
            height: 50,
          ),
        ),
      ),
    );
  }
}
