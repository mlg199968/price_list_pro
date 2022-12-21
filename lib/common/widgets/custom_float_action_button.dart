

import 'package:flutter/material.dart';




class CustomFloatActionButton extends StatelessWidget {
  const CustomFloatActionButton({Key? key,required this.onPressed}) : super(key: key);
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed:onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: const Icon(Icons.add),
    );
  }
}



class CustomFabLoc extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    return Offset(
      scaffoldGeometry.scaffoldSize.width * .8, ///customize here
      scaffoldGeometry.scaffoldSize.height * .83,
    );
  }
}
