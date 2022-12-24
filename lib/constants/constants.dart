import 'package:flutter/material.dart';


const String uri = 'http://192.168.1.3:3000';

const kMainGradiant = LinearGradient(
  colors: [Colors.deepPurple, Colors.blueAccent],
);

var kCardGradiant = const LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topRight,
  stops: [0,0.7],
  colors: [Colors.deepPurple, Colors.transparent],
);
const kWhiteColor=Colors.white;
const kColor1=Colors.deepPurple;
const List<String> unitList=['عدد','متر','کیلو','متر مربع','متر مکعب','گرم'];
const kSpaceBetween=20.0;

final kBoxDecoration=BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: Colors.blue));







const kHeaderStyle = TextStyle(
  fontWeight:FontWeight.bold,
  fontSize: 20,
  //color: Colors.white
);
const kCellStyle = TextStyle(
  fontSize: 20,
);
final kInputDecoration=InputDecoration(
  hintText: 'نام محصول',

  hintStyle: const TextStyle(color: kColorController,fontSize: 15,),
  contentPadding: const EdgeInsets.all(10),
  focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: kColorController)
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
  ),
);

final kButtonStyle=TextButtonThemeData(

  style: ButtonStyle(
    backgroundColor:
    MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) {
        return kColorController;
      }
      if(states.contains(MaterialState.disabled)) {
        return kColorController.withOpacity(0.3);
      } else {
        return kColorController;
      }
    }),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),



  ),
);



const kGradiantColor1=LinearGradient(
  colors: [Color(0XFF4A00E0),Color(0XFF8E2DE2),],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
const kColorController=Color(0XFF4A00E0);
