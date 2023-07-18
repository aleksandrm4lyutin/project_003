import 'package:flutter/material.dart';

class TestGame extends StatefulWidget {
  const TestGame({Key? key}) : super(key: key);

  @override
  State<TestGame> createState() => _TestGameState();
}

class _TestGameState extends State<TestGame> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('JUST FOR TEST. HERE WILL BE SOME GAME OR APP',
            style: TextStyle(color: Colors.lightGreenAccent, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
