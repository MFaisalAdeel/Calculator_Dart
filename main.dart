import 'package:calculator01/cal_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userinputvalue = '';
  var resultvalue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        userinputvalue.toString(),
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      Text(
                        resultvalue.toString(),
                        style:
                            const TextStyle(fontSize: 50, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CalButton(
                            Buttontitle: 'AC',
                            Buttoncolor: Colors.orange,
                            onPress: () {
                              userinputvalue = "";
                              resultvalue = '';
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '%',
                            onPress: () {
                              userinputvalue += "%";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: 'DEL',
                            onPress: () {
                              userinputvalue = userinputvalue.substring(
                                  0, userinputvalue.length - 1);
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '/',
                            onPress: () {
                              userinputvalue += "/";
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalButton(
                            Buttontitle: '7',
                            onPress: () {
                              userinputvalue += "7";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '8',
                            onPress: () {
                              userinputvalue += "8";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '9',
                            onPress: () {
                              userinputvalue += "9";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: 'X',
                            onPress: () {
                              userinputvalue += "x";
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalButton(
                            Buttontitle: '4',
                            onPress: () {
                              userinputvalue += "4";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '5',
                            onPress: () {
                              userinputvalue += "5";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '6',
                            onPress: () {
                              userinputvalue += "6";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '-',
                            onPress: () {
                              userinputvalue += "-";
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalButton(
                            Buttontitle: '1',
                            onPress: () {
                              userinputvalue += "1";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '2',
                            onPress: () {
                              userinputvalue += "2";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '3',
                            onPress: () {
                              userinputvalue += "3";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '+',
                            onPress: () {
                              userinputvalue += "+";
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalButton(
                            Buttontitle: '0',
                            onPress: () {
                              userinputvalue += "0";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '00',
                            onPress: () {
                              userinputvalue += "00";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '.',
                            onPress: () {
                              userinputvalue += ".";
                              setState(() {});
                            },
                          ),
                          CalButton(
                            Buttontitle: '=',
                            onPress: () {
                              equalPress();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void equalPress() {
    String finaluserinputvalue = userinputvalue.replaceAll("x", '*');

    Parser p = Parser();
    Expression expression = p.parse(userinputvalue);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    resultvalue = eval.toString();
  }
}
