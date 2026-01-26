import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";

  // বাটন ক্লিক হ্যান্ডলার
  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") equation = "0";
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*').replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  // বাটন তৈরির উইজেট
  Widget buildButton(String btnText, Color btnColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
            backgroundColor: btnColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => buttonPressed(btnText),
          child: Text(
            btnText,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[100],
          centerTitle: true,
          title: Text(
            "Calculator",
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            // ডিসপ্লে এরিয়া
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 15, 10, 2),
              child: Text(equation, style: TextStyle(fontSize: 25)),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Text(
                result,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: Divider(height: 5)),
            // বাটন গ্রিড
            Column(
              children: [
                Row(
                  children: [
                    buildButton("C", Colors.redAccent),
                    buildButton("⌫", Colors.blue),
                    buildButton("÷", Colors.blue),
                  ],
                ),
                Row(
                  children: [
                    buildButton("7", Colors.grey),
                    buildButton("8", Colors.grey),
                    buildButton("9", Colors.grey),
                    buildButton("×", Colors.blue),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.grey),
                    buildButton("5", Colors.grey),
                    buildButton("6", Colors.grey),
                    buildButton(" - ", Colors.blue),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.grey),
                    buildButton("2", Colors.grey),
                    buildButton("3", Colors.grey),
                    buildButton("+", Colors.blue),
                  ],
                ),
                Row(
                  children: [
                    buildButton(".", Colors.grey),
                    buildButton("0", Colors.grey),
                    buildButton("=", Colors.orangeAccent),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
