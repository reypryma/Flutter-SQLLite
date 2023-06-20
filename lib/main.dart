import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:webmiss/helper/theme_data.dart';

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
      home: const GenerateTriangleScreen(),
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
  FocusNode f1 = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // generatedTriangle = 'Please Input The Data';
    super.initState();
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

  String generateNewTriangle(List<String> s){
    String temp = '';
    for(var i = 0 ; i < s.length ; i++){
      var zeroRepeat = '';
      var j = 0;
      while(j <= i){
        zeroRepeat += '0';
        j++;
      }
      temp += '${s[i]}$zeroRepeat\n';
    }
    return temp;
  }

  String generateNewTriangle2(){
    String s = '';
    int temp = 5;
    for(int i = 5; i >0 ; i--){
      int j = 0;
      while(j <= 5){
        if(j<i){
          s +=' ';
        }else{
          s +='*';
        }
        j++;
      }
      s +='\n';
    }
    return s;
  }



  String returnNumberOfWord(){
    String s = '';
    var arr = [];
    arr = "saya makan nasi goreng dan adik makan nasi goreng spesial".split(' ');

    // var counts = arr.fold<Map<String, int>>({}, (map, element) {
    //   map[element] = (map[element] ?? 0) + 1;
    // });
    //
    // counts.forEach((key, value) {
    //   s += '${key} : ${value} \n';
    // });

    int i = 0;
    while(i <= arr.length) {
      var j = arr.length - 1;
      int temp = 1;
      while (j > i) {
        if (arr[j] == arr[i]) {
          temp++;
        }else if(j == i + 1){
          s += '${arr[i]} : ${temp} \n';
          break;
        }
        j--;
      }
      i++;
    }

    return s;
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
                Text(generateNewTriangle2(), style: secondaryTextStyle(),),
                16.height,
                Text(returnNumberOfWord(), style: secondaryTextStyle(),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
