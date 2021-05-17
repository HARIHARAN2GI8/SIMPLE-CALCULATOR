import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: myapp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.pink),
  ));
}

class myapp extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  String res, txt = '';
  int first;
  int second;
  String opp;
  void btnclicked(String btntxt) {
    if (btntxt == "C") {
      res = '';
      txt = '';
      first = 0;
      second = 0;
    } else if (btntxt == '+' ||
        btntxt == '-' ||
        btntxt == 'x' ||
        btntxt == '/') {
      first = int.parse(txt);
      res = '';
      opp = btntxt;
    } else if (btntxt == '=') {
      second = int.parse(txt);
      if (opp == '+') {
        res = (first + second).toString();
      }
      if (opp == '-') {
        res = (first - second).toString();
      }
      if (opp == 'x') {
        res = (first * second).toString();
      }
      if (opp == '/') {
        res = (first / second).toString();
      }
    } else {
      res = int.parse(txt + btntxt).toString();
    }

    setState(() {
      txt = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                txt,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.redAccent.shade700),
              ),
            )),
            Row(children: [
              Expanded(
                child: buildOutlineButton('9'),
              ),
              Expanded(
                child: buildOutlineButton('8'),
              ),
              Expanded(
                child: buildOutlineButton('7'),
              ),
              Expanded(
                child: buildOutlineButton('+'),
              ),
            ]),
            Row(children: [
              Expanded(
                child: buildOutlineButton('6'),
              ),
              Expanded(
                child: buildOutlineButton('5'),
              ),
              Expanded(
                child: buildOutlineButton('4'),
              ),
              Expanded(
                child: buildOutlineButton('-'),
              ),
            ]),
            Row(children: [
              Expanded(
                child: buildOutlineButton('3'),
              ),
              Expanded(
                child: buildOutlineButton('2'),
              ),
              Expanded(
                child: buildOutlineButton('1'),
              ),
              Expanded(
                child: buildOutlineButton('x'),
              ),
            ]),
            Row(children: [
              Expanded(
                child: buildOutlineButton('C'),
              ),
              Expanded(
                child: buildOutlineButton('0'),
              ),
              Expanded(
                child: buildOutlineButton('='),
              ),
              Expanded(
                child: buildOutlineButton('/'),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  OutlineButton buildOutlineButton(String value) {
    return OutlineButton(
      padding: EdgeInsets.all(30),
      borderSide: BorderSide(color: Colors.purple, width: 7),
      splashColor: Colors.pink,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(26.0),
      ),
      onPressed: () {
        btnclicked(value);
      },
      child: Text(
        value,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
