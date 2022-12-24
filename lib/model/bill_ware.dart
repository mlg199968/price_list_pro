import 'dart:convert';

class BillWare {
  final String wareName;
  final String unit;
  final num sale;
  final num quantity;
  final num sum;
  final String? id;

  BillWare({
    required this.wareName,
    required this.unit,
    required this.sale,
    required this.quantity,
    required this.sum,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'wareName': wareName,
      'unit': unit,
      'sale': sale,
      'quantity': quantity,
      'sum' : sum,
      'id': id,
    };
  }

  factory BillWare.fromMap(Map<String, dynamic> map) {
    return BillWare(
      wareName: map['wareName']  ?? "",
      unit: map['unit'] ?? "",
      sale: map['sale'] ?? 0,
      quantity: map['quantity'] ?? 0,
      sum: map['sum'],
      id: map['id'] ?? "",
    );
  }

  String toJson()=>json.encode(toMap());
  factory BillWare.fromJson(String source) => BillWare.fromMap(json.decode(source),);
}
