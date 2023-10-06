import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
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
  List<Book> books = [];
  late final BookController _bookController;

  @override
  void initState() {
    isLoading = true;
    _bookController = Provider.of<BookController>(context, listen: false);
    initFetchBookData();
    super.initState();
  }

  Future initFetchBookData() async {
    try {
      final fetchedBooks = await _bookController.getBooks();
      setState(() {
        books = fetchedBooks!;
        isLoading = false;
      });
    } catch (error) {
      print('Error View fetching book data: $error');
    }
  }

  Future filterPriceBook() async{
    setState(() {
      isLoading = true;
    });

    try {
      final fetchedBooks = await _bookController.getBooks();

      final filteredBooks = fetchedBooks!.where((book) {
        return book.priceRent > 2000 && book.priceRent < 6000;
      }).toList();

      setState(() {
        books = filteredBooks;
        isLoading = false;
      });
    } catch (error) {
      print('Error filtering books by price: $error');
    }
  }

  Future showNotRentedBook() async{
    setState(() {
      isLoading = true;
    });
    print('view not rent');
    try {
      books = (await _bookController.getBooksNotYetRented())!;
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      print('Error View fetching rented data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget mHeading(var value) {
      return Text(value, style: boldTextStyle());
    }

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
        actions: [
          // Add a filter button
          TextButton.icon(
            onPressed: showNotRentedBook,
            icon: Icon(Icons.filter_alt),
            label: Text("Not Rented"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, textStyle: TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.monetization_on_outlined, color: saddleBrown),
            onPressed: () async {
              await filterPriceBook();
            },
          ),
        ],
      ),
      body: isLoading
          ? const LoadingWidget()
          : ListView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                Text('Buku untuk dirental', style: boldTextStyle())
                    .paddingBottom(5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: mHeading('ID'), tooltip: 'id'),
                      DataColumn(label: mHeading('Title'), tooltip: 'title'),
                      DataColumn(label: mHeading('Price'), tooltip: 'Price'),
                      DataColumn(
                          label: mHeading('Category'), tooltip: 'Category'),
                    ],
                    rows: books
                        .map(
                          (data) => DataRow(
                            cells: [
                              DataCell(Text(data.id.toString(),
                                  style: secondaryTextStyle())),
                              DataCell(Text(data.title.toString(),
                                  style: secondaryTextStyle())),
                              DataCell(Text(data.priceRent.toStringAsFixed(2),
                                  style: secondaryTextStyle())),
                              DataCell(Text(data.bookCategory,
                                  style: secondaryTextStyle())),
                            ],
                          ),
                        )
                        .toList(),
                  ).visible(books.isNotEmpty),
                ),
              ],
            ),
    );
  }
}
