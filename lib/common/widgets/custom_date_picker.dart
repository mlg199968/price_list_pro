// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:persian_datetime_picker/persian_datetime_picker.dart';
//
// final ThemeData androidTheme = ThemeData(
//   fontFamily: 'Dana',
// );
//
//
//
//
//
// class CustomDatePicker extends StatefulWidget {
//   CustomDatePicker({Key? key, this.title="no title"}) : super(key: key);
//
//   final String title;
//
//   @override
//   _CustomDatePickerState createState() => _CustomDatePickerState();
// }
//
// class _CustomDatePickerState extends State<CustomDatePicker> {
//   String label = '';
//
//   String selectedDate = Jalali.now().toJalaliDateTime();
//
//   @override
//   void initState() {
//     super.initState();
//     label = 'انتخاب تاریخ زمان';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text(
//             widget.title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(color: Colors.black),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               colors: [Colors.white, Color(0xffE4F5F9)],
//             ),
//           ),
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             physics: const BouncingScrollPhysics(),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       imageButton(
//                         onTap: () async {
//                           Jalali? picked = await showPersianDatePicker(
//                             context: context,
//                             initialDate: Jalali.now(),
//                             firstDate: Jalali(1385, 8),
//                             lastDate: Jalali(1450, 9),
//
//                           );
//                           if (picked != null && picked != selectedDate) {
//                             setState(() {
//                               label = picked.toJalaliDateTime();
//                             });
//                           }
//                         },
//                         image: '08',
//                       ),
//                       imageButton(
//                         onTap: () async {
//                           Jalali? pickedDate = await showModalBottomSheet<Jalali>(
//                             context: context,
//                             builder: (context) {
//                               Jalali tempPickedDate=DateTime.now().toJalali();
//                               return SizedBox(
//                                 height: 250,
//                                 child: Column(
//                                   children: <Widget>[
//                                     Container(
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: <Widget>[
//                                           CupertinoButton(
//                                             child: const Text(
//                                               'لغو',
//                                               style: TextStyle(
//                                                 fontFamily: 'Dana',
//                                               ),
//                                             ),
//                                             onPressed: () {
//                                               Navigator.of(context).pop();
//                                             },
//                                           ),
//                                           CupertinoButton(
//                                             child: const Text(
//                                               'تایید',
//                                               style: TextStyle(
//                                                 fontFamily: 'Dana',
//                                               ),
//                                             ),
//                                             onPressed: () {
//                                               Navigator.of(context).pop(tempPickedDate);
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const Divider(
//                                       height: 0,
//                                       thickness: 1,
//                                     ),
//                                     Expanded(
//                                       child: Container(
//                                         child: CupertinoTheme(
//                                           data: const CupertinoThemeData(
//                                             textTheme: CupertinoTextThemeData(
//                                               dateTimePickerTextStyle: TextStyle(fontFamily: 'Dana'),
//                                             ),
//                                           ),
//                                           child: PCupertinoDatePicker(
//                                             mode: PCupertinoDatePickerMode.dateAndTime,
//                                             onDateTimeChanged: (Jalali dateTime) {
//                                               tempPickedDate = dateTime;
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           );
//
//                           if (pickedDate != null) {
//                             setState(() {
//                               label = '${pickedDate.toDateTime()}';
//                             });
//                           }
//                         },
//                         image: '07',
//                       ),
//                       imageButton(
//                         onTap: () async {
//                           var picked = await showPersianTimePicker(
//                             context: context,
//                             initialTime: TimeOfDay.now(),
//                             initialEntryMode: PTimePickerEntryMode.input,
//                             builder: (context,child) {
//                               return Directionality(
//                                 textDirection: TextDirection.rtl,
//                                 child: child!,
//                               );
//                             },
//                           );
//                           setState(() {
//                             if (picked != null) label = picked.persianFormat(context);
//                           });
//                         },
//                         image: '09',
//                       ),
//                       imageButton(
//                         onTap: () async {
//                           Jalali? pickedDate = await showModalBottomSheet<Jalali>(
//                             context: context,
//                             builder: (context) {
//                               Jalali tempPickedDate=DateTime.now().toJalali();
//                               return SizedBox(
//                                 height: 250,
//                                 child: Column(
//                                   children: <Widget>[
//                                     Container(
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: <Widget>[
//                                           CupertinoButton(
//                                             child: const Text(
//                                               'لغو',
//                                               style: TextStyle(
//                                                 fontFamily: 'Dana',
//                                               ),
//                                             ),
//                                             onPressed: () {
//                                               Navigator.of(context).pop();
//                                             },
//                                           ),
//                                           CupertinoButton(
//                                             child: const Text(
//                                               'تایید',
//                                               style: TextStyle(
//                                                 fontFamily: 'Dana',
//                                               ),
//                                             ),
//                                             onPressed: () {
//                                               print(tempPickedDate);
//
//                                               Navigator.of(context).pop(tempPickedDate);
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const Divider(
//                                       height: 0,
//                                       thickness: 1,
//                                     ),
//                                     Expanded(
//                                       child: Container(
//                                         child: CupertinoTheme(
//                                           data: const CupertinoThemeData(
//                                             textTheme: CupertinoTextThemeData(
//                                               dateTimePickerTextStyle: TextStyle(fontFamily: 'Dana'),
//                                             ),
//                                           ),
//                                           child: PCupertinoDatePicker(
//                                             mode: PCupertinoDatePickerMode.time,
//                                             onDateTimeChanged: (Jalali dateTime) {
//                                               tempPickedDate = dateTime;
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           );
//
//                           if (pickedDate != null) {
//                             setState(() {
//                               label = '${pickedDate.toJalaliDateTime()}';
//                             });
//                           }
//                         },
//                         image: '05',
//                       ),
//                     ],
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: Container(
//           height: 70,
//           width: double.infinity,
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(boxShadow: [
//             BoxShadow(
//               blurRadius: 3,
//               spreadRadius: 0,
//               offset: const Offset(0, 4),
//               color: const Color(0xff000000).withOpacity(0.3),
//             ),
//           ], color: Colors.white),
//           child: Center(
//             child: Text(
//               label,
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget imageButton({
//     required VoidCallback onTap,
//     required String image,
//   }) {
//     return ScaleGesture(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 3,
//                 spreadRadius: 0,
//                 offset: const Offset(0, 4),
//                 color: const Color(0xff000000).withOpacity(0.3),
//               ),
//             ],
//             borderRadius: const BorderRadius.all(Radius.circular(10))),
//         child: Image.asset(
//           'assets/images/1.jpg',
//           fit: BoxFit.fitWidth,
//         ),
//       ),
//     );
//   }
// }
//
// class ScaleGesture extends StatefulWidget {
//   final Widget child;
//   final double scale;
//   final VoidCallback onTap;
//
//   ScaleGesture({
//     required this.child,
//     this.scale = 1.1,
//     required this.onTap,
//   });
//   @override
//   _ScaleGestureState createState() => _ScaleGestureState();
// }
//
// class _ScaleGestureState extends State<ScaleGesture> {
//   late double scale;
//
//   @override
//   void initState() {
//     scale = 1;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (detail) {
//         setState(() {
//           scale = widget.scale;
//         });
//       },
//       onTapCancel: () {
//         setState(() {
//           scale = 1;
//         });
//       },
//       onTapUp: (detail) {
//         setState(() {
//           scale = 1;
//         });
//         widget.onTap();
//       },
//       child: Transform.scale(
//         scale: scale,
//         child: widget.child,
//       ),
//     );
//   }
// }