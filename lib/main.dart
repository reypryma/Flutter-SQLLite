import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:webmiss/helper/theme_data.dart';
import 'package:webmiss/ssgestalt/demo.dart';

import 'helper/axis.dart';

void main() {
  runApp(const MyApp());
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

class GenerateTriangleScreen extends StatefulWidget {
  const GenerateTriangleScreen({Key? key}) : super(key: key);

  @override
  State<GenerateTriangleScreen> createState() => _GenerateTriangleScreenState();
}

class _GenerateTriangleScreenState extends State<GenerateTriangleScreen> {
  TextEditingController inputController = TextEditingController();
  String generatedTriangle = 'Please Input The Data';
  String assign = '';
  FocusNode f1 = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // generatedTriangle = 'Please Input The Data';
    // print(0);
    super.initState();
    assign = printNumber(10);
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  void formValidation(int type) async{
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      toast('Success');
    }
    setState(() { });
  }

  String printNumber(int n){
    if (n == 1) {
      return '1';
    } else {
      return '${printNumber(n - 1)} $n';
    }
  }

  String arrayNumb(){
    var arr1 = [1, 2, 3, 4, 10];
    var arr2 = [3, 15, 5, 6, 8, 9, 11, 12, 13, 4];
    var arrCombine = [];

    for(var i = 0; i < arr1.length; i++){
      for(var j = 0; j < arr2.length; j++){
        if(arr1[i] == arr2[j]){
          arrCombine.add(arr2[j]);
        }
      }
    }

    return arrCombine.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(64),
            width: context.width(),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    controller: inputController,
                    decoration: inputDecoration(context, hintText: 'Input Angka', ),
                    focusNode: f1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the input';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onFieldSubmitted: (v) {
                      f1.unfocus();
                    },
                  ),
                ),
                32.height,
                Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  direction: getAxis(context.width()),
                  children: [
                    AppButton(
                      textColor: black,
                      onTap: (){
                        formValidation(0);
                      },
                      child: const Text('Generate Segitiga'),
                    ),
                    16.width,
                    16.height,
                    AppButton(
                      color: yellowGreen,
                      textColor: black,
                      onTap: ()async{
                        formValidation(1);
                      },
                      child: const Text('Generate Bilangan Ganjil'),
                    ),
                    16.width,
                    16.height,
                    AppButton(
                      color: blueViolet,
                      textColor: black,
                      onTap: (){
                        formValidation(3);
                      },
                      child: const Text('Generate Bilangan Prima'),
                    ),
                  ],
                ),
                32.height,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Result',
                      style: boldTextStyle(color: black, size: 32)),
                ),
                // Text(generateNewTriangle2(), style: secondaryTextStyle(),),
                // 16.height,
                // Text(returnNumberOfWord(), style: secondaryTextStyle(),),
                Text(assign),
                32.height,
                Text(arrayNumb()),
                32.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
