import 'dart:convert';

class Customer {
  final String firstName;
  final String lastName;
  final String nickName;
  final String phoneNumber;
  final String description;
  final String? id;

  Customer({
    required this.firstName,
    required this.lastName,
    required this.nickName,
    required this.phoneNumber,
    required this.description,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'nickName': nickName,
      'phoneNumber': phoneNumber,
      'description': description,
      'id':id,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      nickName: map['nickName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
    );
  }
String toJson()=>json.encode(toMap());
factory Customer.fromJson(String source) =>Customer.fromMap(jsonDecode(source));
//
}
