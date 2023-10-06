import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webmiss/ssgestalt/demo.dart';
import 'package:webmiss/ssgestalt/question_six/controller/book_services.dart';
import 'package:webmiss/ssgestalt/question_six/sqllite_helper.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final databaseService = DatabaseHelper();
  await databaseService.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  SSGestaltCodingTest(),
      ),
    );
  }
}
