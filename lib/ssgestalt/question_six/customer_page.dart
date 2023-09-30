import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../helper/loader.dart';
import 'controller/book_services.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  bool isLoading = true;
  final BookController _bookController = BookController();
  late final customers;

  @override
  void initState() {
    isLoading = true;
    initCustomerData();
    super.initState();
  }

  Future initCustomerData() async {
    try {
      final specialCustomers = await _bookController.getSpecialCustomer();
      setState(() {
        customers = specialCustomers;
        isLoading = false;
      });
    } catch (error) {
      print('Error initializing customer data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Customer Tables"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? const LoadingWidget()
          : Center(
              child: Column(children: [
                Text('Customer dengan lebih dari 10 pembelian',
                        style: boldTextStyle())
                    .paddingBottom(5),
                Text(customers.toString())
              ]),
            ),
    );
  }
}
