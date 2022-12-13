import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(padding:MaterialStateProperty.all(const EdgeInsets.all(0))),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration: BoxDecoration(gradient: kMainGradiant,borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
          child: Text(text,style: const TextStyle(color:Colors.white,fontSize: 15),)),

    );
  }
}
