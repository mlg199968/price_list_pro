import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';


// ignore: must_be_immutable
class CellContent extends StatelessWidget {
  CellContent(
      {super.key,
      required this.cell,
        this.cell2,
      required this.holderFlex,
      this.onTap,
      this.align=TextAlign.right,
      this.maxSize});
  int holderFlex = 1;
  String cell;
  final String? cell2;
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
            alignment:align==TextAlign.right ? Alignment.centerRight:Alignment.centerLeft,
            height: cell2==null?50:70,
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
            decoration: BoxDecoration(
                color: kColorController.withOpacity(.2),
                borderRadius: BorderRadius.circular(0),),


            child: SingleChildScrollView(
              child: Column(
                children: [
                  AutoSizeText(
                    cell,
                    overflow: TextOverflow.ellipsis,
                    textAlign:align,
                    maxLines: 2,
                    style: kCellStyle,
                    minFontSize: 12,
                    maxFontSize: maxSize ?? 20,
                  ),
                  cell2==null?const SizedBox():
                  AutoSizeText(
                    cell2!,
                    overflow: TextOverflow.ellipsis,
                    textAlign:align,
                    maxLines: 2,
                    style: kCellStyle,
                    minFontSize: 12,
                    maxFontSize: maxSize ?? 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
