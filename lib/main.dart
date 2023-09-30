import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:webmiss/helper/theme_data.dart';
import 'package:webmiss/ssgestalt/demo.dart';
import 'package:webmiss/ssgestalt/question_six/sqllite_helper.dart';

import 'helper/axis.dart';

void main() async{
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SSGestaltCodingTest(),
    );
  }
}
