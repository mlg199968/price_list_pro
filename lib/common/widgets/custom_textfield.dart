import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.maxLine = 1,
    this.width=150
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  final int maxLine;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width ,
      child: TextFormField(

        textAlign: TextAlign.center,
        maxLines: maxLine,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          label: Text(label,style: const TextStyle(color: kColor1,fontSize: 18),),
          border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kColor1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: kColor1)),

        ),
      ),
    );
  }
}
