import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart'
    as formatter;

enum TextFormatter { price, normal, number }

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.maxLine = 1,
    this.width = 150,
    this.textFormat = TextFormatter.normal,
    this.onChange,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  final int maxLine;
  final double width;
  final TextFormatter textFormat;
  // ignore: prefer_typing_uninitialized_variables
  final  onChange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        onChanged:(val){
          if(val==null) {
            onChange(val);
          }
        },
        validator: (val){
          if(val==null){
          }
        },
        keyboardType:
            (textFormat == TextFormatter.number || textFormat==TextFormatter.price) ? TextInputType.number : null,
        inputFormatters: textFormat == TextFormatter.price
            ? [
                formatter.CurrencyTextInputFormatter(
                  symbol: "",
                  decimalDigits: 0,
                )
              ]
            : null,
        textAlign: TextAlign.center,
        maxLines: maxLine,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hoverColor: Colors.white70,
          label: Text(
            label,
            style: const TextStyle(color: kColor1, fontSize: 18),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kColor1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: kColor1)),
          errorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color:Colors.red)),
        ),
      ),
    );
  }
}
