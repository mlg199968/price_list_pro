import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';


// ignore: must_be_immutable
class CellContent extends StatelessWidget {
  CellContent(
      {super.key,
      required this.cell,
      required this.holderFlex,
      this.onTap,
      this.align=TextAlign.right,
      this.maxSize});
  int holderFlex = 1;
  String cell;
  final VoidCallback? onTap;
  final TextAlign align;
  final double? maxSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: holderFlex,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.centerRight,
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: kColorController.withOpacity(.2),
                borderRadius: BorderRadius.circular(0)),
            child: AutoSizeText(
              cell,
              overflow: TextOverflow.ellipsis,
              textAlign:align,
              maxLines: 2,
              style: kCellStyle,
              minFontSize: 12,
              maxFontSize: maxSize ?? 20,
            ),
          ),
        ),
      ),
    );
  }
}
