import 'package:flutter/material.dart';

class FieldAndValue extends StatelessWidget {
  final title;
  final value;

  const FieldAndValue({super.key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5,bottom: 20),
            width: 150,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only( left: 20,bottom: 20,right: 10),
              child: Text(value,style: const TextStyle(fontSize: 20),),
            ),
          )
        ],
      ),
    );
  }
}
