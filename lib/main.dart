import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  bool buttonEnableFlag = false;
  String displayText = '';
  int operatorCount = 0;
  double result;
  String currentOperator  = '';
  bool clearFlag = false;

  double calculation(double num1 , double num2, String operator){
    if(operator == '+') return num1 + num2;
    else if (operator == '-') return num1 - num2;
    else if (operator == 'x') return num1 * num2;
    else if (operator == '/') return num1 / num2;
    else if (operator == '%') return num1 % num2;
  }

  void handleButtonEvent(String s){
    setState(() {
      //print('Operator count:  $operatorCount');
      if(s == '1'){
        if(!buttonEnableFlag) buttonEnableFlag = true;
        if(clearFlag && operatorCount==0) {
          displayText = '';
          clearFlag = false;
        }
        displayText = displayText + s;
      }
      else if(s == '2') {
        if(!buttonEnableFlag) buttonEnableFlag = true;
        if(clearFlag && operatorCount==0) {
          displayText = '';
          clearFlag = false;
        }
        displayText = displayText + s;
      }
      else if(s == '3') {
        if(!buttonEnableFlag) buttonEnableFlag = true;
        if(clearFlag && operatorCount==0) {
          displayText = '';
          clearFlag = false;
        }
        displayText = displayText + s;
      }
      else if(s == '4') {
        if(!buttonEnableFlag) buttonEnableFlag = true;
        if(clearFlag && operatorCount==0) {
          displayText = '';
          clearFlag = false;
        }
        displayText = displayText + s;
      }
      else if(s == '5') {
        if(!buttonEnableFlag) buttonEnableFlag = true;
        if(clearFlag && operatorCount==0) {
          displayText = '';
          clearFlag = false;
        }
        displayText = displayText + s;
      }
      else if(s == '6') {
        if(!buttonEnableFlag) buttonEnableFlag = true;
        if(clearFlag && operatorCount==0) {
          displayText = '';
          clearFlag = false;
        }
        displayText = displayText + s;
      }
      else if(s == '7') {
        if(!buttonEnableFlag) buttonEnableFlag = true;
        if(clearFlag && operatorCount==0) {
          displayText = '';
          clearFlag = false;
        }
        displayText = displayText + s;
      }
      else if(s == '8') {
        if(!buttonEnableFlag) buttonEnableFlag = true;
        if(clearFlag && operatorCount==0) {
          displayText = '';
          clearFlag = false;
        }
        displayText = displayText + s;
      }
      else if(s == '9') {
        if(!buttonEnableFlag) buttonEnableFlag = true;
        if(clearFlag && operatorCount==0) {
          displayText = '';
          clearFlag = false;
        }
        displayText = displayText + s;
      }
      else if(s == '0') {
        if(!buttonEnableFlag) buttonEnableFlag = true;
        if(clearFlag && operatorCount==0) {
          displayText = '';
          clearFlag = false;
        }
        displayText = displayText + s;
      }
      else if(s == '.'){
        if(buttonEnableFlag) {
          buttonEnableFlag = false;
          if(clearFlag) {
            displayText = '';
            clearFlag = false;
          }
          displayText = displayText + s;
        }
      }
      else if(s == 'C') {
        displayText = '';
        currentOperator = '';
        operatorCount = 0;
      }
      else if(s == '>') {
        int stringlen = displayText.length;
        if(displayText[stringlen-1] == '+' || displayText[stringlen-1] == '-' ||
            displayText[stringlen-1] == 'x' || displayText[stringlen-1] == '/' ||
            displayText[stringlen-1] == '%'){
          buttonEnableFlag = true;
          currentOperator = '';
          operatorCount = 0;
        }
        displayText = displayText.substring(0,stringlen-1);
      }
      else if((s == '+') || (s == '-') || (s == 'x') || (s == '/') || (s =='%')) {
        if(buttonEnableFlag){
          if(operatorCount == 0){
            operatorCount = 1;
            displayText = displayText + s;
          }else{
            List<String> ls = displayText.split(currentOperator);
            String temp1,temp2;
            //print('VALUE AT START '+ls.elementAt(0));
            if(ls.elementAt(0)==''){
              temp1 = '-'+ls.elementAt(1);
              temp2 = ls.elementAt(2);
            }else{
              temp1 = ls.elementAt(0);
              temp2 = ls.elementAt(1);
            }
            double num1 = double.parse(temp1);
            double num2 = double.parse(temp2);
            result = calculation(num1, num2, currentOperator);
            displayText = result.toStringAsFixed(3) + s;
          }
          currentOperator = s;
          buttonEnableFlag = false;
        }
      }
      else if(s == '='){
        if(buttonEnableFlag){
          if(operatorCount == 0){
            displayText = displayText;
          }else{
            List<String> ls = displayText.split(currentOperator);
            String temp1,temp2;
            //print('VALUE AT START '+ls.elementAt(0));
            if(ls.elementAt(0)==''){
              temp1 = '-'+ls.elementAt(1);
              temp2 = ls.elementAt(2);
            }else{
              temp1 = ls.elementAt(0);
              temp2 = ls.elementAt(1);
            }
            double num1 = double.parse(temp1);
            double num2 = double.parse(temp2);
            result = calculation(num1, num2, currentOperator);
            displayText = result.toStringAsFixed(2);
            operatorCount = 0;
            clearFlag = true;
          }
          currentOperator = '';
        }
      }
      else if(s =='+/-'){
        if(buttonEnableFlag){
          if(operatorCount == 0){
            if(displayText[0] == '-') displayText = displayText.substring(1,displayText.length);
            else displayText = '-' + displayText;
          }else{
            List<String> ls = displayText.split(currentOperator);
            String temp1,temp2;
            //print('VALUE AT START '+ls.elementAt(0));
            if(ls.elementAt(0)==''){
              temp1 = '-'+ls.elementAt(1);
              temp2 = ls.elementAt(2);
            }else{
              temp1 = ls.elementAt(0);
              temp2 = ls.elementAt(1);
            }
            double num1 = double.parse(temp1);
            double num2 = double.parse(temp2);
            result = calculation(num1, num2, currentOperator);
            displayText = result.toStringAsFixed(2);
            if(displayText[0] == '-') displayText = displayText.substring(1,displayText.length);
            else displayText = '-' + displayText;
            operatorCount = 0;
            clearFlag = true;
          }
          currentOperator = '';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('Calculator'),
        ),
        body:Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                color: Colors.blueGrey.withOpacity(0.80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      displayText,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontSize: 45.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              //child: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        singleButton3('C'),
                        singleButton3('>'),
                        singleButton3('%'),
                        singleButton3('/'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        singleButton('7'),
                        singleButton('8'),
                        singleButton('9'),
                        singleButton3('x'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        singleButton('4'),
                        singleButton('5'),
                        singleButton('6'),
                        singleButton3('-'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        singleButton('1'),
                        singleButton('2'),
                        singleButton('3'),
                        singleButton3('+'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        singleButton('+/-'),
                        singleButton('0'),
                        singleButton('.'),
                        singleButton3('='),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //),
          ],
        )
    );
  }

  Widget singleButton(String keyvalue){
    return Expanded(
      flex: 1,
      child: FlatButton(
        onPressed: () { handleButtonEvent(keyvalue);},
        color: Colors.grey.withOpacity(0.75),
        splashColor: Colors.cyanAccent.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black54.withOpacity(0.50),
            style: BorderStyle.solid,
          ),
        ),
        child: Text(
          keyvalue,
          style: TextStyle(
            color: Colors.black87.withOpacity(0.75),
            fontSize: 35.0,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }

  Widget singleButton3(String keyvalue){
    return Expanded(
      flex: 1,
      child: FlatButton(
        onPressed: () { handleButtonEvent(keyvalue);},
        color: Colors.black38.withOpacity(0.55),
        splashColor: Colors.cyanAccent.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black54,
            style: BorderStyle.solid,
          ),
        ),
        child: Text(
          keyvalue,
          style: TextStyle(
            color: Colors.black87.withOpacity(0.75),
            fontSize: 35.0,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
