import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:price_list_pro/constants/utils.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}
    ){
  switch(response.statusCode){
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      print("error handling part");
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      print("error handling part");
      break;
      case 401:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      print("ware with same name exist!");
      break;
    case 200:
      onSuccess();
      break;
    default:
      showSnackBar(context,response.body);

  }
}