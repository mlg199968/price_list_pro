// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/constants/error_handling.dart';
import 'package:price_list_pro/constants/utils.dart';
import 'package:price_list_pro/model/ware.dart';

class WareServices {
  // ignore: non_constant_identifier_names
  void addWare({
    required BuildContext context,
    required String wareName,
    required String unit,
    required String group,
    String description = "",
    required double cost,
    required double sale,
    required double quantity,
  }) async {
    try {
      Ware ware = Ware(
        wareName: wareName,
        unit: unit,
        group: group,
        description: description,
        cost: cost,
        sale: sale,
        quantity: quantity,
      );
      http.Response res = await http.post(
        Uri.parse("$uri/user/ware/post"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: ware.toJson(),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Ware successfully added");
          });
    } catch (e) {
      showSnackBar(context, "Ware post error $e");
    }
  }

  Future<List<Ware>> getWares(BuildContext context) async {
    final List<Ware> wareList = [];
    http.Response res = await http.get(
      Uri.parse("$uri/ware/get-wares"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; ++i) {
            wareList.add(
              Ware.fromJson(
                jsonEncode(jsonDecode(res.body)[i]),
              ),
            );
          }
        });

    return wareList;
  }
}
