import 'package:flutter/material.dart';

class FlexibleButton extends StatelessWidget {
  final Color iconColor;
  final Color backGround;
  final String labelText;
  final IconData icon;
  double width;
  double height;

   FlexibleButton(
      {Key? key,
      required this.iconColor,
      required this.icon,
      required this.labelText,
      required this.backGround,
      this.height = 50,
      this.width = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backGround,
          ),
          child: Icon(
            icon,
            size: 40,
            color: iconColor,
          ),
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        // Text(
        //   labelText,
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // )
      ],
    );
  }
}
