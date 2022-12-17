import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';

// ignore: must_be_immutable
class DropListModel extends StatefulWidget {
  const DropListModel({
    super.key,
    required this.listItem,
    required this.onChanged,
    this.width=140,
    this.height=50,
  });

  final List listItem;
  final Function onChanged;
  final double width;
  final double height;

  @override
  State<DropListModel> createState() => _DropListModelState();
}

class _DropListModelState extends State<DropListModel> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(

        dropdownWidth: widget.width,
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
        onChanged: (val) {
          selectedValue = val.toString();
          widget.onChanged(val);
          setState(() {});
        },
        //widget.onChanged,

        buttonHeight: widget.height,
        buttonWidth: widget.width,
        itemHeight: widget.height,
      ),
    );
  }
}
