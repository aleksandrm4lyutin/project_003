import 'package:flutter/material.dart';

class EstGuide extends StatefulWidget {
  const EstGuide({Key? key}) : super(key: key);

  @override
  State<EstGuide> createState() => _EstGuideState();
}

class _EstGuideState extends State<EstGuide> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Container(
            color: Colors.grey.shade900,
            child: Column(
              children: const [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    '"To view the statistics of past matches, you must guess the outcome of the meeting. If you fail to do so, statistics will not be available.',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'To help with the solution and simplify the process, you can use the hints or the store.',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'If you answer correctly, you will get green card that you can spend in the store to buy different bonuses. If you\'ve used a hint before, you\'ll get fewer green cards.',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'You will get yellow cards for wrong answers, and red cards for wrong answers after hints. This only affects the your statistics."',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
              ],
            )
          ),
        )
      ],
    );
  }
}
