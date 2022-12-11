import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';


// ignore: must_be_immutable
class DropListModel extends StatefulWidget {
   const DropListModel(
      {super.key, required this.listItem,
      required this.onChanged,});

  final List listItem;
  final Function onChanged;

  @override
  State<DropListModel> createState() => _DropListModelState();
}

class _DropListModelState extends State<DropListModel> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        alignment: Alignment.centerRight,
        scrollbarRadius: const Radius.circular(5),
        buttonDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: kColorController)),
        hint: const Text(
          'no Group',
          style: TextStyle(fontSize: 20, color: kColorController),
        ),

        items: widget.listItem
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 20,
                      color: kColorController,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue ?? widget.listItem[0],
        onChanged:(val){
          selectedValue=val.toString();
          widget.onChanged(val);
          setState(() {});
        },
          //widget.onChanged,

        buttonHeight: 50,
        buttonWidth: 140,
        itemHeight: 40,
      ),
    );
  }
}
