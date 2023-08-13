import 'package:flutter/material.dart';

import 'est_events.dart';
import 'est_guide.dart';
import 'est_metrics.dart';
import 'est_settings.dart';
import 'est_shop.dart';

class EstHome extends StatefulWidget {
  const EstHome({Key? key}) : super(key: key);

  @override
  State<EstHome> createState() => _EstHomeState();
}

class _EstHomeState extends State<EstHome> with TickerProviderStateMixin {

  late TabController _tabController;
  int currentTab = 0;
  int greenCards = 10;// TODO pull real number

  List<String> titles = [
    'EVENTS',
    'SHOP',
    'SETTINGS',
    'GUIDE',
    'METRICS',
  ];
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        centerTitle: true,
        title: Text(titles[currentTab], style: const TextStyle(fontSize: 23, color: Colors.white),),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 100),
          child: Stack(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue.shade900,
                alignment: Alignment.topCenter,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.0),
                  child: Image(
                    image: AssetImage('assets/img/Est_logo.PNG'),
                    //height: 40,
                    //width: 100,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10,),
                        Icon(Icons.watch_later_outlined, size: 30, color: Colors.grey.shade500)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10,),
                        Text('$greenCards', style: TextStyle(fontSize: 24, color: Colors.grey.shade500),),
                        const SizedBox(width: 5,),
                        const Image(
                          image: AssetImage('assets/img/est_green_card.png'),
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade900,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('EVENTS',
                      style: TextStyle(
                        color: currentTab == 0 ? Colors.white : Colors.grey.shade500,
                        fontSize: 23
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      currentTab = 0;
                      _tabController.animateTo(0);
                    });
                  },
                ),

                Container(
                  width: 2,
                  height: 40,
                  color: Colors.grey.shade500,
                ),

                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('SHOP',
                      style: TextStyle(
                        color: currentTab == 1 ? Colors.white : Colors.grey.shade500,
                        fontSize: 23
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      currentTab = 1;
                      _tabController.animateTo(1);
                    });
                  },
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('SETTINGS',
                      style: TextStyle(
                        color: currentTab == 2 ? Colors.white : Colors.grey.shade500,
                        fontSize: 23
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      currentTab = 2;
                      _tabController.animateTo(2);
                    });
                  },
                ),

                Container(
                  width: 2,
                  height: 40,
                  color: Colors.grey.shade500,
                ),

                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('GUIDE',
                      style: TextStyle(
                        color: currentTab == 3 ? Colors.white : Colors.grey.shade500,
                        fontSize: 23
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      currentTab = 3;
                      _tabController.animateTo(3);
                    });
                  },
                ),

                Container(
                  width: 2,
                  height: 40,
                  color: Colors.grey.shade500,
                ),

                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('METRICS',
                      style: TextStyle(
                      color: currentTab == 4 ? Colors.white : Colors.grey.shade500,
                      fontSize: 23
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      currentTab = 4;
                      _tabController.animateTo(4);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          EstEvents(),
          EstShop(),
          EstSettings(),
          EstGuide(),
          EstMetrics(),
        ],
      ),
    );
  }
}
