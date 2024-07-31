import 'package:flutter/material.dart';

Widget infoText({required text, required String label}) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
        Flexible(child: Text('$label:',style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 20),)),
        Text('$text',style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
  ],
);
