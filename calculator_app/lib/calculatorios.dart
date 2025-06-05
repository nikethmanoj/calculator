import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculatorios extends StatefulWidget {
  const Calculatorios ({super.key});

  @override
  State<Calculatorios> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculatorios> {
  String input = "";
  String output = "0";
  
  void buttonpresssed(String value){
    setState(() {
      if(value=="AC"){
        input = "";
        output = "0";
      }else if(value == "Del"){
        input = input.isNotEmpty ? input.substring(0,input.length-1) : "";
      }else if(value == "="){
        try{
          output = evaluateExp(input);

        }catch(e){
          output == "ERROR";
        }
      }else{
          input = input + value ;
      }
    });

  } 

  String evaluateExp(String expression){
    try{
      return _calculate(expression).toString();
    }catch(e){
      return "ERROR";
    }

  }
  double _calculate(String expression) {
  expression = expression.replaceAll("x", "*").replaceAll("÷", "/");
  Parser p = Parser();
  Expression exp = p.parse(expression);
  ContextModel cm = ContextModel();
  return exp.evaluate(EvaluationType.REAL,cm);

}
  Widget buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          buttonpresssed(text);
        },
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(32),
            backgroundColor:
             (text == "=" ||
              text == "x" ||
              text == "/" ||
              text == "+" ||
              text == "-")
                ? const Color.fromARGB(255, 234, 188, 21)
                : (text == "AC" || text == "Del" || text == "%")
                    ? const Color.fromARGB(255, 128, 128, 128)
                    : const Color.fromARGB(66, 48, 48, 48),
            foregroundColor: text == "=" ? const Color.fromARGB(255, 249, 247, 247) : const Color.fromARGB(255, 241, 237, 237),
            shape: CircleBorder()
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 246, 244, 244),
                        fontSize: 25),
                  ),
                  Text(
                    output,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 247, 245, 245),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [Row(
              children: [
                buildButton("AC"),
                buildButton("Del"),
                buildButton("%"),
                buildButton("/"),
              ],
            ),
            Row(
              children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("x"),
              ],
            ),
            Row(children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("-"),
            ],),
            Row(children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("+"),
            ],),
            Row(children: [
              buildButton("00"),
              buildButton("0"),
              buildButton("."),
              buildButton("="),
            ],)
            ],
          )
        ],
      ),
    );
  }
}
  