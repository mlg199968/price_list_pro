import 'dart:convert';

class WareSqflite {
  final String wareName;
  final String unit;
  final String groupName;
  final String description;
  final num cost;
  final num sale;
  final num quantity;
  final DateTime date;
  final String? wareID;

  WareSqflite({
    required this.wareName,
    required this.unit,
    required this.groupName,
    required this.description,
    required this.cost,
    required this.sale,
    required this.quantity,
    required this.date,
    this.wareID="",
  });

  Map<String, dynamic> toMap() {
    return {
      'wareName': wareName,
      'unit': unit,
      'groupName': groupName,
      'description': description,
      'cost': cost,
      'sale': sale,
      'quantity': quantity,
      'date': date.toIso8601String(),
      'wareID': wareID,
    };
  }

  factory WareSqflite.fromMap(Map<String, dynamic> map) {
    return WareSqflite(
      wareName: map['wareName'] ?? "",
      unit: map['unit'] ?? "",
      groupName: map['groupName'] ?? "",
      description: map['description'] ?? "",
      cost: map['cost'] ?? 0,
      sale: map['sale'] ?? 0,
      quantity: map['quantity'] ?? 0,
      date: DateTime.parse(map['date']),
      wareID: map['wareID'] ?? "",
    );
  }
  String toJson() => json.encode(toMap());
  factory WareSqflite.fromJson(String source) => WareSqflite.fromMap(
    json.decode(source),
  );

  WareSqflite copy({
    String? wareName,
    String? unit,
    String? groupName,
    String? description,
    num? cost,
    num? sale,
    num? quantity,
    DateTime? date,
    String? wareID,
  }) =>
      WareSqflite(
        wareName: wareName ?? this.wareName,
        unit: unit ?? this.unit,
        groupName: groupName ?? this.groupName,
        description: description ?? this.description,
        cost: cost ?? this.cost,
        sale: sale ?? this.sale,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
        wareID: wareID ?? this.wareID,
      );
}
