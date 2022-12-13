import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.maxLine = 1,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  final int maxLine;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      maxLines: maxLine,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label,style: const TextStyle(color: kColor1,fontSize: 18),),
        border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kColor1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: kColor1)),

      ),
    );
  }
}
