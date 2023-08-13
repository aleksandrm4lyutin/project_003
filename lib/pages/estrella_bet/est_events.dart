import 'package:flutter/material.dart';
import 'package:project_003/pages/estrella_bet/slider_button.dart';


class EstEvents extends StatefulWidget {
  const EstEvents({Key? key}) : super(key: key);

  @override
  State<EstEvents> createState() => _EstEventsState();
}

class _EstEventsState extends State<EstEvents> {

  bool pastComingUp = true;
  int numberOfTeamPairs = 4;//TODO
  List<bool> scoreHidden = [true, false, true, true];//TODO
  List<String> teamNames = [
    'TEAM 1',
    'TEAM 2',
    'TEAM 3',
    'TEAM 4',
  ];
  List<String> teamLogos = [
    'assets/img/est_team_logo_0.png',
    'assets/img/est_team_logo_1.png',
    'assets/img/est_team_logo_2.png',
    'assets/img/est_team_logo_3.png',
  ];
  List<List<int>> temPairs = [
    [0, 1],
    [2, 3],
    [0, 1],
    [2, 3],
  ];

  //TODO
  void genScoreHidden() {
    scoreHidden = [];
    for(var i = 0; i < numberOfTeamPairs; i++) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20,),

        InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.grey.shade300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('LEAGUE 2', style: TextStyle(color: Colors.grey.shade800, fontSize: 21),),
                const SizedBox(width: 5,),
                Icon(Icons.play_arrow, size: 28, color: Colors.grey.shade800,),
              ],
            ),
          ),
        ),


        const SizedBox(height: 20,),

        Center(
          child: SliderButton(
              label0: 'Past',
              label1: 'Coming Up',
              w: 250,
              h: 40,
              border: false,
              value: pastComingUp,
              onTap: () {
                setState(() {
                  pastComingUp = !pastComingUp;
                });
              }
          ),
        ),

        Column(
         children: List.generate(numberOfTeamPairs, (index) {
           return Padding(
             padding: const EdgeInsets.symmetric(vertical: 10.0),
             child: Container(
               width: MediaQuery.of(context).size.width,
               height: 100,
               color: Colors.blue.shade800,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       children: [
                         Image(
                           image: AssetImage(teamLogos[temPairs[index][0]]),
                           height: 40,
                           width: 40,
                         ),
                         const SizedBox(height: 5,),
                         Text(teamNames[temPairs[index][0]],
                           style: const TextStyle(color: Colors.white, fontSize: 16),
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(width: 10,),

                   // TODO replace Strings with proper Dates, time, etc.
                   Column(
                     children: [
                       const SizedBox(height: 10,),
                       const Text('11.08.23',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                       ),

                       const Text('10:30',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 18,
                         ),
                       ),

                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           gradient: LinearGradient(
                             begin: Alignment.topLeft,
                             end: Alignment.bottomRight,
                             colors: [
                               scoreHidden[index] ? Colors.greenAccent : Colors.transparent,
                               scoreHidden[index] ? Colors.grey.shade700 : Colors.transparent,
                             ],
                           )
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(1.0),
                           child: Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: scoreHidden[index] ? Colors.grey.shade900 : Colors.transparent,
                             ),
                             child: Padding(
                               padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                               child: Text('3 : 1',
                                 style: TextStyle(
                                   color: !scoreHidden[index] ? Colors.red : Colors.transparent,
                                   fontSize: 24,
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),

                   const SizedBox(width: 10,),
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       children: [
                         Image(
                           image: AssetImage(teamLogos[temPairs[index][1]]),
                           height: 40,
                           width: 40,
                         ),
                         const SizedBox(height: 5,),
                         Text(teamNames[temPairs[index][1]],
                           style: const TextStyle(color: Colors.white, fontSize: 16),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
           );
         }),
        ),

        const SizedBox(height: 80,),
      ],
    );
  }
}
