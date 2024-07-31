import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Color iconColor;
  final Color backGround;
  final String labelText;
  final IconData icon;
  final Widget page;

  const MenuButton(
      {Key? key,
      required this.iconColor,
      required this.icon,
      required this.labelText,
      required this.backGround,
      required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Container(
            width: 50,
            height: 50,
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
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          labelText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
