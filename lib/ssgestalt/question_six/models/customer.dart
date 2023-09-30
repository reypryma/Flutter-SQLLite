import 'dart:convert';

import 'package:flutter/widgets.dart';

class Customer {
  int id;
  String name;
  String identityCardNumber;
  String? address;
  Customer({
    required this.id,
    required this.name,
    required this.identityCardNumber,
    this.address,
  });


  Customer copyWith({
    int? id,
    String? name,
    String? identityCardNumber,
    ValueGetter<String?>? address,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      identityCardNumber: identityCardNumber ?? this.identityCardNumber,
      address: address != null ? address() : this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'identity_card_number': identityCardNumber,
      'address': address,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      identityCardNumber: map['identity_card_number'] ?? '',
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, identityCardNumber: $identityCardNumber, address: $address)';
  }
}
