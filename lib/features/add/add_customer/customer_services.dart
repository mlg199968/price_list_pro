import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/constants/error_handling.dart';
import 'package:price_list_pro/constants/utils.dart';
import 'package:price_list_pro/model/customer.dart';
import 'package:http/http.dart' as http;

class CustomerServices {
  void postCustomerData({
    required BuildContext context,
    required String firstName,
    required String lastName,
    String nickName = "",
    required String phoneNumber,
    String description = "",
  }) async {
try{
  Customer customer = Customer(
      firstName: firstName,
      lastName: lastName,
      nickName: nickName,
      phoneNumber: phoneNumber,
      description: description);

  http.Response res = await http.post(Uri.parse("$uri/user/customers"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: customer.toJson());
  // ignore: use_build_context_synchronously
  httpErrorHandle(response: res, context: context, onSuccess: (){
    showSnackBar(context, "Customer Successfully added!");
  });


}catch(e){
  showSnackBar(context,"Customer Services error: $e");
  rethrow;
}
  }

  Future<List<Customer>> getCustomers(BuildContext context)async{
    List<Customer> customerList=[];
    try{
      http.Response res=await http.get(Uri.parse("$uri/user/get-customers"),headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      // ignore: use_build_context_synchronously
      httpErrorHandle(response: res, context: context, onSuccess: (){
       for(int i=0;i<jsonDecode(res.body).length;i++){
         customerList.add(Customer.fromJson(jsonEncode(jsonDecode(res.body)[i]),),);
       }
      });
    }catch(e){
      showSnackBar(context, "getCustomers List error $e");
      rethrow;
    }
    return customerList;
  }
}
