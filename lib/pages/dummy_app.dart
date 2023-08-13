
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_003/pages/actual_app.dart';
import 'package:project_003/pages/estrella_bet/est_home.dart';
import 'package:project_003/pages/test_game.dart';





class DummyApp extends StatefulWidget {
  const DummyApp({Key? key}) : super(key: key);

  @override
  State<DummyApp> createState() => _DummyAppState();
}



class _DummyAppState extends State<DummyApp> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EstHome();

  }

}
