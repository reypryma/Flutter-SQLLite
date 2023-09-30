import 'dart:convert';

import 'package:flutter/widgets.dart';

class Rent {
  int id;
  int? customerId;
  int? bookId;
  DateTime dateRent;
  DateTime? dateReturn;
  Rent({
    required this.id,
    this.customerId,
    this.bookId,
    required this.dateRent,
    this.dateReturn,
  });

  Rent copyWith({
    int? id,
    ValueGetter<int?>? customerId,
    ValueGetter<int?>? bookId,
    DateTime? dateRent,
    ValueGetter<DateTime?>? dateReturn,
  }) {
    return Rent(
      id: id ?? this.id,
      customerId: customerId != null ? customerId() : this.customerId,
      bookId: bookId != null ? bookId() : this.bookId,
      dateRent: dateRent ?? this.dateRent,
      dateReturn: dateReturn != null ? dateReturn() : this.dateReturn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customer_id': customerId,
      'book_id': bookId,
      'date_rent': dateRent.millisecondsSinceEpoch,
      'date_return': dateReturn?.millisecondsSinceEpoch,
    };
  }

  factory Rent.fromMap(Map<String, dynamic> map) {
    return Rent(
      id: map['id']?.toInt() ?? 0,
      customerId: map['customer_id']?.toInt(),
      bookId: map['book_id']?.toInt(),
      dateRent: DateTime.fromMillisecondsSinceEpoch(map['date_rent']),
      dateReturn: map['date_return'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateReturn'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rent.fromJson(String source) => Rent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Rent(id: $id, customerId: $customerId, bookId: $bookId, dateRent: $dateRent, dateReturn: $dateReturn)';
  }
}
