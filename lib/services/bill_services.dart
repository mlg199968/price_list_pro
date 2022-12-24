import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/constants/error_handling.dart';
import 'package:price_list_pro/constants/utils.dart';
import 'package:price_list_pro/model/bill.dart';
import 'package:price_list_pro/model/bill_ware.dart';
import 'package:price_list_pro/model/customer.dart';

class BillServices {
  // ignore: non_constant_identifier_names
  Future<void> PostBill({
    required BuildContext context,
    required List<BillWare> billWares,
    required Customer customer,
    required num total,
    required DateTime time,
  }) async {
    try {

      Bill bill = Bill(
          customer: customer, billWares: billWares, time: time, total: total);
      print(bill.time);
      http.Response res = await http.post(
        Uri.parse("$uri/user/bill/post-bill"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bill.toJson(),
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "bill Successfully Stored");
        },
      );
    } catch (e) {
      showSnackBar(context, "bill service error: $e");

    }
  }
}
