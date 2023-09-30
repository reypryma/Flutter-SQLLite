import 'package:webmiss/ssgestalt/question_six/sqllite_helper.dart';

import '../models/book.dart';

class BookController {
  final DatabaseHelper _databaseService = DatabaseHelper();

  Future<List<Book>>? getBooks() async {
    await _databaseService.init();
    print("get books");
    final listBook = await _databaseService.fetchListBook();

    if (listBook == null || listBook.isEmpty) {
      print("list book is empty! fill the code again");
      // If the list is empty or null, populate data
      await _databaseService.initListBook();

      // Fetch the list of books again
      final updatedListBook = await _databaseService.fetchListBook();
      return updatedListBook ?? [];
    }
    print("${listBook.toString()}");
    return listBook;
  }

  Future<List<Book>>? getBooksNotYetRented() async {
    print("get rented books");
    await _databaseService.init();
    print("get rented books");
    final listNotRentedBook = await _databaseService.fetchNotRentedBook();
    print(listNotRentedBook.toString());
    return listNotRentedBook;
  }

  Future<List<Map<String, dynamic>>> getSpecialCustomer() async {
    try {
      final specialCustomers = await _databaseService.fetchCustomersWithMoreThan10Rentals();
      return specialCustomers;
    } catch (error) {
      throw('Error fetching special customers: $error');
    }
  }
}