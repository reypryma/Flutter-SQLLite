import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:webmiss/helper/axis.dart';
import 'package:webmiss/ssgestalt/question_a_one/circular_array.dart';
import 'package:webmiss/ssgestalt/question_b_two/loop_number.dart';
import 'package:webmiss/ssgestalt/question_c_three/calculate_date.dart';
import 'package:webmiss/ssgestalt/question_d_four/array_loop.dart';
import 'package:webmiss/ssgestalt/question_e_five/denominate_rupiah.dart';
import 'package:webmiss/ssgestalt/question_six/book_page.dart';
import 'package:webmiss/ssgestalt/question_six/customer_page.dart';

class SSGestaltCodingTest extends StatefulWidget {
  const SSGestaltCodingTest({super.key});

  @override
  State<SSGestaltCodingTest> createState() => _SSGestaltCodingTestState();
}

class _SSGestaltCodingTestState extends State<SSGestaltCodingTest> {
  TextEditingController inputController = TextEditingController();
  FocusNode f1 = FocusNode();
  List<String> cars = ["Volvo", "BMW", "Toyota", "Kijang"];

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(64),
          width: context.width(),
          child: Column(
            children: [
              32.height,
              Flex(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                direction: getAxis(context.width()),
                children: [
                  AppButton(
                    textColor: black,
                    onTap: (){
                      const BookView().launch(context);
                    },
                    child: const Text('Show List Book'),
                  ),
                  16.width,
                  16.height,
                  AppButton(
                    color: yellowGreen,
                    textColor: black,
                    onTap: ()async{
                      CustomerView().launch(context);
                    },
                    child: const Text('Show Customers'),
                  ),
                  16.width,
                ],
              ),
              32.height,
              Align(
                alignment: Alignment.topLeft,
                child: Text('Result',
                    style: boldTextStyle(color: black, size: 32)),
              ),
              32.height,
              Text(getCyclicPermutation(cars), style: secondaryTextStyle(),),
              32.height,
              Text(loopNumber(), style: secondaryTextStyle(size: 32),),
              32.height,
              Text(calculateDate(dateBefore: '2008-03-24', dateAfter: "2010-06-26"), style: secondaryTextStyle(size: 32),),
              32.height,
              Text(displayData(), style: secondaryTextStyle(size: 16),),
              32.height,
              Text(calculateDenominations(1586000), style: boldTextStyle(size: 16),),
            ],
          ),
        ),
      ),
    );
  }
}
