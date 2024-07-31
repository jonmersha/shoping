import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 10,
          color: Colors.green.shade200,
        ),
        Container(
          height: 10,
          width: 20,
          color: Colors.green,
        ),
      ],
    );
  }
}
