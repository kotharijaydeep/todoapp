import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/core/colorconstant.dart';
import 'package:todoapp/core/stringconstant.dart';

import '../edittask/edittask.dart';
import '../tabs/dailytab/getmodel/getmodel.dart';

class TaskDetails extends StatefulWidget {
  final Task task;

  TaskDetails(this.task);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

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
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(85),
                child: Container(
                  height: 65,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: StringConstant.lSearchTask,
                                hintStyle: const TextStyle(fontSize: 18),
                                labelStyle: const TextStyle(fontSize: 18),
                                suffixIcon: Image.asset(
                                  "assets/landingscreen/search.png",
                                  width: 70,
                                ),
                                border: const OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                    height: 250,
                    width: 390,
                    color: ColorConstant.whiteColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                                fontSize: 16, color: ColorConstant.greyColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.task.description,
                            style: TextStyle(
                                fontSize: 18, color: ColorConstant.greyColor),
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
                        onPressed: () {}, icon: Icon(Icons.delete_outline)),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditTask()),
                          );
                        },
                        icon: Icon(Icons.edit
                        ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.watch_later_outlined)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.check_box_outlined)),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
