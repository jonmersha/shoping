import 'package:flutter/material.dart';

Widget buildTextFormFieldText(
    TextEditingController controller, String label, String hint,
    {int maxLines = 1}) {
  return Container(
    //height: 60,
    alignment: AlignmentDirectional.centerStart,
    margin: const EdgeInsets.only(top: 5),
    padding: const EdgeInsets.symmetric(horizontal: 6.0),
    decoration:  BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,),
    child: TextFormField(

      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: InputBorder.none,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      maxLines: maxLines,
    ),
  );
}

Widget buildTextFormFieldNumber(
    TextEditingController controller, String label, String hint,
    {int maxLines = 1}) {
  return Container(
    //height: 60,
    alignment: AlignmentDirectional.centerStart,
    margin: const EdgeInsets.only(top: 5),
    padding: const EdgeInsets.symmetric(horizontal: 6.0),
    decoration:  BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,),
    child: TextFormField(

      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: InputBorder.none,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      maxLines: maxLines,
    ),
  );
}

