import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(this.text,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w600),);
  }
}