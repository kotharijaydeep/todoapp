import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/core/colorconstant.dart';
import 'package:todoapp/core/stringconstant.dart';
import 'package:todoapp/views/donetask/done_task.dart';

import '../edittask/edittask.dart';
import '../tabs/dailytab/getmodel/getmodel.dart';

class TaskDetails extends StatefulWidget {
  final Task task;

  TaskDetails(this.task);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            backgroundColor: ColorConstant.scaffoldColor,
            appBar: AppBar(
              elevation: 0,
              title: Text(
                StringConstant.taskDetails,
                style: TextStyle(fontWeight: FontWeight.bold),
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
                        Navigator.of(context).pushNamed("/taskview");
                      },
                      icon: Image.asset("assets/landingscreen/add.png",
                          width: 32, color: ColorConstant.whiteColor),
                    ),
                  ],
                ),
              ],
            ),
            body: Stack(
              children: [
                Container(
                  height: 50,
                  color: ColorConstant.mainAppColor,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    // height: 250,
                    width: MediaQuery.of(context).size.width,
                    color: ColorConstant.whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipPath(
                              clipper: MyCustomClipper(),
                              child: Container(
                                height: 25,
                                width: 180,
                                color: Colors.blue,
                                child: Center(
                                    child: Text(
                                  StringConstant.nicetohave,
                                  style: TextStyle(
                                      color: ColorConstant.whiteColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.task.taskname,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.task.datetime,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstant.greyColor),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.task.description,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorConstant.greyColor),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "Category:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorConstant.blackColor),
                                      children: [
                                    TextSpan(
                                        text: " ${widget.task.category}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: ColorConstant.greyColor))
                                  ]))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_outline,
                          color: ColorConstant.iconColor,
                        )),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditTask()),
                        );
                      },
                      icon: Icon(Icons.edit, color: ColorConstant.iconColor),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.watch_later_outlined,
                            color: ColorConstant.iconColor)),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DoneTask()),
                          );
                        },
                        icon: Icon(Icons.check_box_outlined,
                            color: ColorConstant.iconColor)),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 6, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
