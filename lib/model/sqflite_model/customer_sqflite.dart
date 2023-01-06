import 'dart:convert';

class CustomerSqflite {
  final String firstName;
  final String lastName;
  final String nickName;
  final String phoneNumber;
  final String phoneNumber2;
  final String description;
  final DateTime date;
  final num score;
  final String customerId;

  CustomerSqflite({
    required this.firstName,
    required this.lastName,
    required this.nickName,
    required this.phoneNumber,
    required this.phoneNumber2,
    required this.description,
    required this.date,
    required this.score,
    required this.customerId,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'nickName': nickName,
      'phoneNumber': phoneNumber,
      'phoneNumber2': phoneNumber2,
      'description': description,
      'date': date.toIso8601String(),
      'score': score,
      'customerId': customerId,
    };
  }

  factory CustomerSqflite.fromMap(Map<String, dynamic> map) {
    return CustomerSqflite(
      firstName: map['firstName'] ?? "",
      lastName: map['lastName'] ?? "",
      nickName: map['nickName'] ?? "",
      phoneNumber: map['phoneNumber'] ?? "",
      phoneNumber2: map['phoneNumber2'] ?? "",
      description: map['description'] ?? "",
      date: DateTime.parse(map['date']),
      score: map['score'] ?? 10,
      customerId: map['customerId'] ?? "",
    );
  }
  String toJson() => json.encode(toMap());
  factory CustomerSqflite.fromJson(String source) =>
      CustomerSqflite.fromMap(jsonDecode(source));
//
}
