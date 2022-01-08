import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color fillColor;
  final Color textColor;
  final double textSize;
  final double buttonWidth;
  final Function callback;
  const CalcButton({
    Key? key,
    required this.text,
    this.fillColor = const Color.fromRGBO(80, 80, 80, 1),
    this.textColor = Colors.white,
    this.textSize = 24,
    required this.callback,
    this.buttonWidth = 65,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: buttonWidth,
        height: 65,
        child: TextButton(
          onPressed: () {
            callback(text);
          },
          child: Text(text,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                fontSize: textSize,
              ))),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )),
            backgroundColor: MaterialStateProperty.all<Color>(fillColor),
            foregroundColor: MaterialStateProperty.all<Color>(textColor),
          ),
        ),
      ),
    );
  }
}
