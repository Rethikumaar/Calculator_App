import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  double size = 80.0;
  String inputValue = "";
  String calculatedValue = "";
  String operator = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Display Area
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    inputValue,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),

              // Buttons Area
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calButton("7", Colors.purpleAccent.shade200),
                      calButton("8", Colors.purpleAccent.shade200),
                      calButton("9", Colors.purpleAccent.shade200),
                      calButton("/", Colors.brown.shade300),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calButton("4", Colors.purpleAccent.shade200),
                      calButton("5", Colors.purpleAccent.shade200),
                      calButton("6", Colors.purpleAccent.shade200),
                      calButton("*", Colors.brown.shade300),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calButton("1", Colors.purpleAccent.shade200),
                      calButton("2", Colors.purpleAccent.shade200),
                      calButton("3", Colors.purpleAccent.shade200),
                      calButton("-", Colors.brown.shade300),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calButton("0", Colors.purpleAccent.shade200),
                      calButton(".", Colors.purpleAccent.shade200),
                      calButton("=", Colors.brown.shade300),
                      calButton("+", Colors.brown.shade300),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      calButton("clear", Colors.red.shade400),
                    ],
                  ),
                  SizedBox(height: 20), // Spacer at bottom
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget calButton(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        if (text == "clear") {
          setState(() {
            inputValue = "";
            calculatedValue = "";
            operator = "";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            calculatedValue = inputValue;
            inputValue = "";
            operator = text;

          });
        } else if (text == "=") {
          setState(() {
            double calc = double.parse(calculatedValue);
            double input = double.parse(inputValue);
            if (operator == "+") {
              inputValue = (calc + input).toString();
            } else if (operator == "-") {
              inputValue = (calc - input).toString();
            } else if (operator == "*") {
              inputValue = (calc * input).toString();
            } else if (operator == "/") {
              inputValue = (calc / input).toString();
            }
          });
        } else {
          setState(() {
            inputValue = inputValue + text;
          });
        }
      },
      child: Container(
        height: size,
        width: size,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgcolor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child:

        Text(text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
