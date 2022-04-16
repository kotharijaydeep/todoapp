import 'package:flutter/material.dart';
import 'package:todoapp/core/colorconstant.dart';

import '../../../core/colorconstant.dart';

class Calenderr extends StatefulWidget {
  const Calenderr({Key? key, }) : super(key: key);

  @override
  _CalenderrState createState() => _CalenderrState();
}

class _CalenderrState extends State<Calenderr> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.scaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 0);
                },
                itemCount: 7,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentDateSelectedIndex = index;
                        selectedDate =
                            DateTime.now().add(Duration(days: index));
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorConstant.mainAppColor
                            /* color: currentDateSelectedIndex == index
                            ? ColorConstant.whiteColor
                            : Colors.deepPurpleAccent,*/
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  listOfDays[DateTime.now()
                                              .add(Duration(days: index))
                                              .weekday - 1
                                  ].toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: currentDateSelectedIndex == index
                                          ? ColorConstant.calendartext1Color
                                          : ColorConstant.calendartextColor),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  DateTime.now()
                                      .add(Duration(days: index))
                                      .day
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: currentDateSelectedIndex == index
                                          ? ColorConstant.blackColor
                                          : ColorConstant.whiteColor),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ClipPath(
                          child: Container(
                            height: 80,
                            width: 60,
                            decoration: BoxDecoration(
                              color: currentDateSelectedIndex == index
                                  ? ColorConstant.whiteColor
                                  : ColorConstant.transparentColor
                            ),
                            child: currentDateSelectedIndex == index
                                ? Container(
                                    decoration: const BoxDecoration(
                                        color: ColorConstant.whiteColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorConstant.greyColor,
                                            blurRadius: 5,
                                            spreadRadius: 5,

                                          ),
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          listOfDays[DateTime.now()
                                                      .add(
                                                          Duration(days: index))
                                                      .weekday -
                                                  1]
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: currentDateSelectedIndex ==
                                                      index
                                                  ? ColorConstant
                                                      .greyColor
                                                  : ColorConstant
                                                      .calendartextColor),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          DateTime.now()
                                              .add(Duration(days: index))
                                              .day
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                              color: currentDateSelectedIndex ==
                                                      index
                                                  ? ColorConstant.blackColor
                                                  : ColorConstant.whiteColor),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ),
                          clipper: currentDateSelectedIndex == index
                              ? MyCustomClipper()
                              : null,
                        ),
                      ],
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);

    var curXPos = 0.0;
    var curYPos = size.height;
    var increment = size.width / 2;
    while (curXPos < 1) {
      curXPos += increment;
      curYPos = curYPos == size.height ? size.height - 10 : size.height;
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
