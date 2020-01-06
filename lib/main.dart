import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic 8 Ball',
      home: MagicBallPage(title: 'Magic 8 Ball'),
    );
  }
}

class MagicBallPage extends StatefulWidget {
  MagicBallPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MagicBallPageState createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  final Map<int, String> options = {
    1: 'Yes',
    2: 'No',
    3: 'Probably',
    4: "I don't know",
  };

  int index = 1;

  void shake8Ball() {
    setState(() {
      index = Random().nextInt(4) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey[500],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  options[index],
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: shake8Ball,
              child: Text(
                'Shake it',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.grey[900],
            ),
          ],
        ),
      ),
    );
  }
}
