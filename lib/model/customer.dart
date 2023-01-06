import 'dart:convert';

class Customer {
  final String firstName;
  final String lastName;
  final String nickName;
  final String phoneNumber;
  final String description;
  final DateTime date;
  final num score;
  final String id;

  Customer({
    required this.firstName,
    required this.lastName,
    required this.nickName,
    required this.phoneNumber,
    required this.description,
    required this.date,
    required this.score,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'nickName': nickName,
      'phoneNumber': phoneNumber,
      'description': description,
      'dare': date.toIso8601String(),
      'score': score,
      'id': id,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      firstName: map['firstName'] ?? "",
      lastName: map['lastName'] ?? "",
      nickName: map['nickName'] ?? "",
      phoneNumber: map['phoneNumber'] ?? "",
      description: map['description'] ?? "",
      date: DateTime.parse(map['date']),
      score: map['score'] ?? 10,
      id: map['id'] ?? "",
    );
  }
  String toJson() => json.encode(toMap());
  factory Customer.fromJson(String source) =>
      Customer.fromMap(jsonDecode(source));
//
}
