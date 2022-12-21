import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
double StringToDouble(String text){
  return double.parse(text.replaceAll(RegExp(r'[^0-9]'),''));

}

String addSeparator(double number){
   return NumberFormat('###,###,###,###').format(number);
}

// Future<List<File>> pickImages()async{
//    List<File> images=[];
//   try{
//     var pickedFiles=await FilePicker.platform.pickFiles(allowMultiple:true);
//     if(pickedFiles!=null && pickedFiles.files.isNotEmpty) {
//       for (int i = 0; i < pickedFiles.files.length; i++) {
//         images.add(
//           File(pickedFiles.files[i].path!),
//         );
//       }
//     }
//   }catch(e){
//     debugPrint(e.toString());
//   }
//   return images;
// }