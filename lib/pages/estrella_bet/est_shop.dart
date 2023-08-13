import 'package:flutter/material.dart';

class EstShop extends StatefulWidget {
  const EstShop({Key? key}) : super(key: key);

  @override
  State<EstShop> createState() => _EstShopState();
}

class _EstShopState extends State<EstShop> {

  final count = 6; // TODO pull the actual number?
  List<String> items = [
    '',
    '1 EXTRA HINT DAY',
    'COMING UP DAY PASS',
    'DAY COMBO',
    '1 EXTRA HINT WEEK',
    'COMING UP WEEK PASS',
    'WEEK COMBO',
  ];
  List<String> items1 = [
    '',
    'you can use 2 hints instead of 1 during the day',
    'you can view upcoming matches withing 24 hours',
    '1 and 2 points at the same time',
    'you can use 2 clues instead of 1 during the week',
    'you can view upcoming matches during the week',
    '4 and 5 points at the same time',
  ];
  List<int> prises = [
    0,
    15,
    15,
    25,
    75,
    75,
    100,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(count + 1, (index) {
        if(index == 0) {
          return const SizedBox(height: 40,);
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              color: Colors.blue.shade800,
              child: Row(
                children: [
                  const SizedBox(width: 60,),

                  Container(
                    width: 70,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade800,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3, color: Colors.blueGrey.shade900),
                    ),
                    child: Text(items[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),

                  const SizedBox(width: 10,),
                  Container(
                    width: 140,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(items1[index],
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),

                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10,),
                          Text('${prises[index]}', style: const TextStyle(fontSize: 20, color: Colors.white),),
                          const SizedBox(width: 5,),
                          const Image(
                            image: AssetImage('assets/img/est_green_card.png'),
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),

                      const SizedBox(height: 5,),

                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              /// TODO get item function
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                                child: Text('GET',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
