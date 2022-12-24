import 'dart:convert';

import 'package:price_list_pro/model/bill_ware.dart';
import 'package:price_list_pro/model/customer.dart';

class Bill {
  final Customer customer;
  final List<BillWare> billWares;
  final DateTime time;
  final num total;
  final String? id;


  Bill({
    required this.customer,
    required this.billWares,
    required this.time,
    required this.total,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'customer': customer.toMap(),
      'billWares': billWares.map((e) => e.toMap()).toList(),
      'time': time.toIso8601String(),
      'total': total,
      'id': id,
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      customer: map['customer'] ,
      billWares: map['billWares'] ,
      time: DateTime.parse(map['time']),
      total: map['total'] ,
      id: map['id'] ,
    );
  }

  String toJson()=>jsonEncode(toMap());
  factory Bill.fromJson(String source)=>Bill.fromMap(jsonDecode(source));
}