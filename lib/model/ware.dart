import 'dart:convert';

class Ware {
  final String wareName;
  final String unit;
  final String group;
  final String description;
  final num cost;
  final num sale;
  final num quantity;
  final String? id;

  Ware({
    required this.wareName,
    required this.unit,
    required this.group,
    required this.description,
    required this.cost,
    required this.sale,
    required this.quantity,
    this.id,
  });



  Map<String, dynamic> toMap() {
    return {
      'wareName': wareName,
      'unit': unit,
      'group': group,
      'description':description,
      'cost': cost,
      'sale': sale,
      'quantity': quantity,
      'id': id,
    };
  }

  factory Ware.fromMap(Map<String, dynamic> map) {
    return Ware(
      wareName: map['wareName'] ?? "",
      unit: map['unit'] ?? "",
      group: map['group'] ?? "",
      description: map['description'] ?? "",
      cost: map['cost'] ?? 0,
      sale: map['sale'] ?? 0,
      quantity: map['quantity'] ?? 0,
      id: map['id'] ?? "",
    );
  }
  String toJson()=>json.encode(toMap());
  factory Ware.fromJson(String source) => Ware.fromMap(json.decode(source),);
}
