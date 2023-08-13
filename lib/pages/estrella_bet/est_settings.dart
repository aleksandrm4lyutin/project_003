import 'package:flutter/material.dart';
import 'package:project_003/pages/estrella_bet/slider_button.dart';


class EstSettings extends StatefulWidget {
  const EstSettings({Key? key}) : super(key: key);

  @override
  State<EstSettings> createState() => _EstSettingsState();
}

class _EstSettingsState extends State<EstSettings> {

  bool sound = true;
  bool stats = false;
  bool events = false;


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ///-----------------------
        const SizedBox(height: 40,),
        const Text('SOUND',
          style: TextStyle(color: Colors.white, fontSize: 21),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10,),
        Center(
          child: SliderButton(
            label0: 'ON',
            label1: 'OFF',
            w: 200,
            h: 50,
            border: true,
            value: sound,
            onTap: () {
              setState(() {
                sound = !sound;
              });
            }
          ),
        ),

        ///-----------------------
        const SizedBox(height: 40,),
        const Text('MY STATS',
          style: TextStyle(color: Colors.white, fontSize: 21),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10,),
        Center(
          child: SliderButton(
            label0: 'ON',
            label1: 'OFF',
            w: 200,
            h: 50,
            border: true,
            value: stats,
            onTap: () {
              setState(() {
                stats = !stats;
              });
            }
          ),
        ),

        ///-----------------------
        const SizedBox(height: 40,),
        const Text('MAKE THE "EVENTS"',
          style: TextStyle(color: Colors.white, fontSize: 21),
          textAlign: TextAlign.center,
        ),
        const Text('THE START SCREEN',
          style: TextStyle(color: Colors.white, fontSize: 21),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10,),
        Center(
          child: SliderButton(
            label0: 'ON',
            label1: 'OFF',
            w: 200,
            h: 50,
            border: true,
            value: events,
            onTap: () {
              setState(() {
                events = !events;
              });
            }
          ),
        ),

        ///-----------------------
        const SizedBox(height: 50,),
        Center(
          child: InkWell(
            onTap: () {
              /// TODO open CHOOSE THE START LEAGUE
            },
            child: Container(
              alignment: Alignment.center,
              width: 310,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(width: 3, color: Colors.white),
              ),
              child: const Text('CHOOSE THE START LEAGUE',
                style: TextStyle(color: Colors.white, fontSize: 21),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
