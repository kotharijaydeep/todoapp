import 'package:flutter/material.dart';
import 'package:todoapp/views/tabs/dailytab/daily_tab.dart';
import 'package:todoapp/views/tabs/monthlytab/monthly_tab.dart';
import 'package:todoapp/views/tabs/weeklytab/weekly_tab.dart';

import '../../core/stringconstant.dart';
import '../drawer/drawer.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with TickerProviderStateMixin{
  int _currentIndex = 0;

  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller =  TabController(
        length: 3, vsync: this,
        );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/landingscreen/todimg.png",
            width: 130,
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/landingscreen/alert.png'),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/addscreen");
                  },
                  icon:  Image.asset(
                    "assets/landingscreen/add.png",
                    width: 32,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Image.asset(
                  'assets/landingscreen/menubar.png',
                  width: 28,
                ));
          }),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(130),
            child: Container(
              height: 109,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: StringConstant.lSearchTask,
                            hintStyle: const TextStyle(fontSize: 20),
                            labelStyle: const TextStyle(fontSize: 20),
                            suffixIcon: Image.asset(
                              "assets/landingscreen/search.png",
                              width: 80,
                            ),
                            border: const OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
                  ),
                  Container(
                    child: TabBar(
                      onTap: (index) {
                        _currentIndex = index;
                      },
                      tabs: [
                        Tab(
                          child: Text(
                            StringConstant.lDaily,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: _currentIndex == 1
                                    ? FontWeight.normal
                                    : FontWeight.bold),
                          ),
                        ),
                        Tab(
                            child: Text(
                          StringConstant.lWeekly,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: _currentIndex == 2
                                  ? FontWeight.normal
                                  : FontWeight.bold),
                        )),
                        Tab(
                          child:Text(StringConstant.lMonthly,
                            style: TextStyle(fontSize: 18,
                                fontWeight: _currentIndex == 3
                                    ? FontWeight.normal
                                    : FontWeight.bold
                            ),

                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            DailyTab(),
            WeeklyTab(),
            MonthlyTab(),
          ],

        ),
        drawer: Drawerr(),
      ),
    );
  }


}
