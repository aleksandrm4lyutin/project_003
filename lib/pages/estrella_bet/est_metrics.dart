import 'package:flutter/material.dart';

class EstMetrics extends StatefulWidget {
  const EstMetrics({Key? key}) : super(key: key);

  @override
  State<EstMetrics> createState() => _EstMetricsState();
}

class _EstMetricsState extends State<EstMetrics> {

  int yellowValue = 13; // TODO replace with actual value
  int greenValue = 20; // TODO replace with actual value
  int redValue = 8; // TODO replace with actual value

  double calculateChartHeight(double h, double v) {
    // TODO remake to actual
    return h - ((h / 100) * v);
  }


  @override
  Widget build(BuildContext context) {

    // TODO add CustomPaint to properly draw charts and lines

    return ListView(
      children: [
        const SizedBox(height: 40,),
        const Center(
          child: Text('THE OUTCOME RATE FOR THIS MONTH',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 40,),

        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade800
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '12.06.2023',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('$yellowValue', style: const TextStyle(color: Colors.white, fontSize: 20),),
                        const SizedBox(height: 5,),
                        Container(
                          width: 40,
                          height: 180,
                          ///height: calculateChartHeight(MediaQuery.of(context).size.width - 80, yellowValue.toDouble()),
                          color: Colors.amber.shade600,
                        ),
                        const SizedBox(height: 40,),
                        const Image(
                          image: AssetImage('assets/img/est_yellow_card.png'),
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('$greenValue', style: const TextStyle(color: Colors.white, fontSize: 20),),
                        const SizedBox(height: 5,),
                        Container(
                          width: 40,
                          height: 210,
                          ///height: calculateChartHeight(MediaQuery.of(context).size.width - 80, greenValue.toDouble()),
                          color: Colors.greenAccent.shade400,
                        ),
                        const SizedBox(height: 40,),
                        const Image(
                          image: AssetImage('assets/img/est_green_card.png'),
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('$redValue', style: const TextStyle(color: Colors.white, fontSize: 20),),
                        const SizedBox(height: 5,),
                        Container(
                          width: 40,
                          height: 120,
                          ///height: calculateChartHeight(MediaQuery.of(context).size.width - 80, redValue.toDouble()),
                          color: Colors.green.shade900,
                        ),
                        const SizedBox(height: 40,),
                        const Image(
                          image: AssetImage('assets/img/est_red_card.png'),
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 0,),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
