import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const ReusableText({super.key, required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 40,
      textAlign: TextAlign.left,
      softWrap: false,
      style: textStyle,
      overflow: TextOverflow.ellipsis,
    );
  }
}
