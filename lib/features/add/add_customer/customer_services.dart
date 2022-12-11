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
  showSnackBar(context, "Customer Services error: $e");
  print(e);
}
  }
}
