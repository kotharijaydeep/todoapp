import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/core/stringconstant.dart';
import 'package:todoapp/views/tabs/dailytab/bloc/daily_bloc.dart';
import 'package:todoapp/views/taskdetails/taskdetails.dart';

import '../../../core/colorconstant.dart';
import '../../addpage/bloc/addtask_bloc.dart';
import '../../addpage/fetchdatfirestore/datafirestore.dart';

class DailyTab extends StatefulWidget {
  const DailyTab({Key? key}) : super(key: key);

  @override
  _DailyTabState createState() => _DailyTabState();
}

class _DailyTabState extends State<DailyTab> {
  int priority = 1;
  int index = 0;
  DateTime selectedDate = DateTime.now();
  List<String> listOfDays = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.scaffoldColor,
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (_) => DailyBloc()..add(GetDataEvent()),
            child: BlocConsumer<DailyBloc, DailyState>(
                builder: (_, state) {
                  if (state is GetDataState) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            color: ColorConstant.whiteColor,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: const TextSpan(
                                          style: TextStyle(
                                              color: ColorConstant.blackColor,
                                              fontSize: 18),
                                          text: 'Good Morning ',
                                          children: [
                                        TextSpan(
                                            text: "John",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "TODAY",
                                        style: TextStyle(
                                            color: ColorConstant.mainAppColor,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "Completed",
                                        style: TextStyle(
                                            color: ColorConstant.greenColor,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text:
                                                "${DateTime.now().add(Duration(days: index)).day.toString()}  ",
                                            style: const TextStyle(
                                                color: ColorConstant.blackColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                text:
                                                    "${listOfDays[DateTime.now().add(Duration(days: index)).month - 1]}, ",
                                                style: const TextStyle(
                                                    color: ColorConstant
                                                        .blackColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text:
                                                    "${DateTime.now().add(Duration(days: index)).year.toString()}",
                                                style: const TextStyle(
                                                    color: ColorConstant
                                                        .blackColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                      ),
                                      RichText(
                                          text: const TextSpan(
                                              text: "5/",
                                              style: TextStyle(
                                                color: ColorConstant.greenColor,
                                                fontSize: 16,
                                              ),
                                              children: [
                                            TextSpan(
                                                text: '10',
                                                style: TextStyle(
                                                  color: ColorConstant.redColor,
                                                  fontSize: 16,
                                                )),
                                          ])),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.userprofileList.length,
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TaskDetails(state.userprofileList[index])));
                                },
                                child: Slidable(
                                  child: Card(
                                    elevation: 3,
                                    child: ListTile(
                                      leading: Text(
                                          state.userprofileList[index].datetime),
                                      title: Text(
                                          state.userprofileList[index].taskname),
                                      subtitle: Text(state
                                          .userprofileList[index].description),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {

                                            },
                                            icon: Icon(
                                              Icons.star_outline,
                                              size: 30,
                                            ),
                                          ),
                                          Container(
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: state
                                                            .userprofileList[
                                                                index]
                                                            .priority ==
                                                        1
                                                    ? ColorConstant.redColor
                                                    : state.userprofileList[index]
                                                                .priority ==
                                                            2
                                                        ? ColorConstant
                                                            .orangeColor
                                                        : state
                                                                    .userprofileList[
                                                                        index]
                                                                    .priority ==
                                                                3
                                                            ? ColorConstant
                                                                .blueColor
                                                            : ColorConstant
                                                                .greenColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  startActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        backgroundColor: ColorConstant.greenColor,
                                        foregroundColor: ColorConstant.whiteColor,
                                        icon: Icons.cloud_done,
                                        label: StringConstant.dDone,
                                        onPressed: (BuildContext context) {},
                                      ),
                                    ],
                                  ),
                                  endActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    // dismissible: DismissiblePane(onDismissed: () {}),
                                    children: [
                                      SlidableAction(
                                        // An action can be bigger than the others.
                                        flex: 2,
                                        backgroundColor: ColorConstant.redColor,
                                        foregroundColor: ColorConstant.whiteColor,
                                        icon: Icons.watch_later_outlined,
                                        label: StringConstant.later,
                                        onPressed: (BuildContext context) {},
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 80),
                              child: Image.asset(
                                  "assets/landingscreen/AlldoneLogo.png",
                                  width: 200),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              StringConstant.lAllDoneForNow,
                              style: TextStyle(
                                  fontSize: 21,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              StringConstant.lNextTask,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(StringConstant.lTomorrow355pm),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              StringConstant.lTimeForaBreak,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
                listener: (BuildContext context, Object? state) {}),
          ),
        ));
  }
}
