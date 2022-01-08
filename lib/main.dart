import 'package:calculator/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  CalcApp({Key? key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color colorOrange = Color.fromRGBO(255, 149, 0, 1);
    const Color colorWhite = Color.fromRGBO(255, 255, 255, 1);
    const Color colorDarkLiver = Color.fromRGBO(80, 80, 80, 1);
    const Color colorLightGray = Color.fromRGBO(212, 212, 210, 1);
    const Color colorBlack = Color.fromRGBO(0, 0, 0, 1);

    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                  color: const Color(0xFF545F61),
                ),
              ),
              alignment: const Alignment(1, 1),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 48,
                  ),
                  color: Colors.white,
                ),
              ),
              alignment: const Alignment(1, 1),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: 'AC',
                  fillColor: colorLightGray,
                  textColor: colorBlack,
                  callback: allClear,
                ),
                CalcButton(
                  text: 'C',
                  fillColor: colorLightGray,
                  textColor: colorBlack,
                  callback: clear,
                ),
                CalcButton(
                  text: '%',
                  fillColor: colorLightGray,
                  textColor: colorBlack,
                  textSize: 30,
                  callback: numClick,
                ),
                CalcButton(
                  text: '/',
                  fillColor: colorOrange,
                  textColor: colorWhite,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7',
                  callback: numClick,
                ),
                CalcButton(
                  text: '8',
                  callback: numClick,
                ),
                CalcButton(
                  text: '9',
                  callback: numClick,
                ),
                CalcButton(
                  text: '*',
                  fillColor: colorOrange,
                  textColor: colorWhite,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '4',
                  callback: numClick,
                ),
                CalcButton(
                  text: '5',
                  callback: numClick,
                ),
                CalcButton(
                  text: '6',
                  callback: numClick,
                ),
                CalcButton(
                  text: '-',
                  fillColor: colorOrange,
                  textColor: colorWhite,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '1',
                  callback: numClick,
                ),
                CalcButton(
                  text: '2',
                  callback: numClick,
                ),
                CalcButton(
                  text: '3',
                  callback: numClick,
                ),
                CalcButton(
                  text: '+',
                  fillColor: colorOrange,
                  textColor: colorWhite,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: CalcButton(
                    buttonWidth: 160,
                    text: '0',
                    callback: numClick,
                  ),
                ),
                CalcButton(
                  text: '.',
                  callback: numClick,
                ),
                CalcButton(
                  text: '=',
                  fillColor: colorOrange,
                  textColor: colorWhite,
                  textSize: 30,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
