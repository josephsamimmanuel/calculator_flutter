import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String inputValue = "";
  String CalcValue = "";
  String operator = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                inputValue,
                style: TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcButton("7", Colors.white38),
                    calcButton("8", Colors.white38),
                    calcButton("9", Colors.white38),
                    calcButton("/", Colors.orange),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcButton("4", Colors.white38),
                    calcButton("5", Colors.white38),
                    calcButton("6", Colors.white38),
                    calcButton("*", Colors.orange),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcButton("1", Colors.white38),
                    calcButton("2", Colors.white38),
                    calcButton("3", Colors.white38),
                    calcButton("-", Colors.orange),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcButton("0", Colors.white38),
                    calcButton(".", Colors.white38),
                    calcButton("=", Colors.orange),
                    calcButton("+", Colors.orange),
                  ],
                ),
              ],
            ),
            calcButton("Clear", Colors.black)
          ],
        ),
      ),
    );
  }

  Widget calcButton(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        if (text == "Clear") {
          setState(() {
            inputValue = "";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          CalcValue = inputValue;
          inputValue = "";
          operator = text;
        } else if (text == "=") {
          setState(() {
            double calc = double.parse(CalcValue);
            double inputVal = double.parse(inputValue);
            double result;
            if (operator == "+") {
              result = calc + inputVal;
            } else if (operator == "-") {
              result = calc - inputVal;
            } else if (operator == "*") {
              result = calc * inputVal;
            } else if (operator == "/") {
              result = calc / inputVal;
            } else {
              result = inputVal;
            }
            inputValue = result.toString();
            CalcValue = "";
            operator = "";
          });
        } else {
          setState(() {
            inputValue = inputValue + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.all(10),
        height: size,
        width: size,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
