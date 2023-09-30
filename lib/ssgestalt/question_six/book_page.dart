import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:webmiss/helper/loader.dart';

import 'controller/book_services.dart';
import 'models/book.dart';

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  bool isLoading = true;
  List<Book>? books;
  final BookController _bookController = BookController();

  @override
  void initState() {
    isLoading = true;
    initFetchBookData();
    super.initState();
  }

  Future initFetchBookData() async {
    try {
      final fetchedBooks = await _bookController.getBooks();
      setState(() {
        books = fetchedBooks;
        isLoading = false;
      });
    } catch (error) {
      print('Error View fetching book data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Book Tables"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading ? LoadingWidget() : ListView(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [

        ],
      ),
    );
  }
}
