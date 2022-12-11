import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {Key? key,
      required this.label,
      required this.image,
      this.height = 200,
      this.width = 150,
      required this.onTap,
      this.direction = true})
      : super(key: key);
  final String label;
  final String image;
  final double width;
  final double height;
  final bool direction;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        color: Colors.black,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color:Colors.black54),
            image: DecorationImage(image: AssetImage("assets/images/$image.jpg"),fit: BoxFit.cover) ,
              borderRadius: BorderRadius.circular(5)),
          alignment: Alignment.center,
          child:Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(gradient:kCardGradiant),
            child: Text(
              label,
              style:
              const TextStyle(color: kWhiteColor, fontSize: 25),
            ),

          ),
        ),
      ),
    );
  }
}


// direction
// ? Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// icon,
// SizedBox(
// height: 10,
// ),
// Text(
// label,
// style:
// const TextStyle(color: kWhiteColor, fontSize: 25),
// ),
// ],
// )
// : Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// icon,
// SizedBox(
// height: 10,
// ),
// ],
// ),
