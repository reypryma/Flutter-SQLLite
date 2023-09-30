import 'dart:convert';

import 'package:flutter/widgets.dart';

class Book {
  int id;
  String title;
  String? author;
  double priceRent;
  String bookCategory;
  Book({
    required this.id,
    required this.title,
    this.author,
    required this.priceRent,
    required this.bookCategory,
  });

  Book copyWith({
    int? id,
    String? title,
    ValueGetter<String?>? author,
    double? priceRent,
    String? bookCategory,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author != null ? author() : this.author,
      priceRent: priceRent ?? this.priceRent,
      bookCategory: bookCategory ?? this.bookCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'price_rent': priceRent,
      'book_category': bookCategory,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      author: map['author'],
      priceRent: map['price_rent']?.toDouble() ?? 0.0,
      bookCategory: map['book_category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, priceRent: $priceRent, bookCategory: $bookCategory)';
  }
}
