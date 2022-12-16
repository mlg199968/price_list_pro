
import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';


// ignore: must_be_immutable
class CellContent extends StatelessWidget {
  CellContent({super.key,
    required this.cell,
    required this.holderFlex,
    this.onTap,

  });
  int holderFlex=1;
  String cell;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {

    return Expanded(
      flex: holderFlex,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: kColorController.withOpacity(.2),borderRadius: BorderRadius.circular(0)),
            child: AutoSizeText(
              cell,

              overflow: TextOverflow.ellipsis,
              textAlign: holderFlex==4?TextAlign.left:TextAlign.right,
              style:kCellStyle,
              minFontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}