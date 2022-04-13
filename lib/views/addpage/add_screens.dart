import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/colorconstant.dart';
import 'package:todoapp/core/stringconstant.dart';


import '../tabs/dailytab/daily_tab.dart';
import 'bloc/addtask_bloc.dart';
import 'fetchdatfirestore/datafirestore.dart';


class TaskView extends StatefulWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      AddtaskBloc()
        ..add(InitialAddTaskEvent()),
      child: AddScreen(),

    );
  }
}


class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  //Priority Color **********************************************

  int isClicked = 5;

  //FormKey******************************************************

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //Switch******************************************************

  bool _switchValue = false;

  //send data Firestore*******************************************************

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController datetimeController = TextEditingController();

  String taskname = "";
  String uid = "";
  String description = "";
  String category = "";
  String datetime = " ";

  ClearText() {
    nameController.clear();
    descriptionController.clear();
    categoryController.clear();
    datetimeController.clear();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.aNewTask),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset("assets/landingscreen/alert.png")),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            height: 60,
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18),
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
              ],
            ),
          ),
        ),
      ),
      body: BlocListener<AddtaskBloc, AddtaskState>(
        listener: (context, state) {
          if (state is PriorityState) {
            isClicked = state.isClicked;
          }
        },
        child: BlocBuilder<AddtaskBloc, AddtaskState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 20, right: 20),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: StringConstant.aTaskName,
                              border: InputBorder.none,
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please enter Task Name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: categoryController,
                            decoration: const InputDecoration(
                              hintText: StringConstant.aCategory,
                              border: InputBorder.none,
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please enter Category';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: descriptionController,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              hintText: StringConstant.aDescription,
                              border: InputBorder.none,
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please enter Description';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DateTimeField(
                            format: DateFormat("dd-MM-yyyy HH:mm"),
                            controller: datetimeController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              hintText: StringConstant.aPickDateTime,
                              border: InputBorder.none,
                            ),
                            onShowPicker: (context, currentValue) async {
                              final date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                              if (date != null) {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now()),
                                );
                                return DateTimeField.combine(date, time);
                              } else {
                                return currentValue;
                              }
                            },
                            validator: (val) {
                              if (val == null) {
                                return "Please enter DateTime";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black12),
                        bottom: BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: const Text(
                              StringConstant.aPriority,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<AddtaskBloc>().add(
                                    PriorityColorEvent(
                                        isClicked: 1
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:ColorConstant.redColor,
                                    border: Border.all(
                                        color: isClicked == 1
                                            ? Colors.red.shade200
                                            : Colors.white,
                                        width: 3),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<AddtaskBloc>().add(
                                    PriorityColorEvent(
                                        isClicked: 2
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConstant.orangeColor,
                                    border: Border.all(
                                        color: isClicked == 2
                                            ? Colors.orange.shade200
                                            : Colors.white,
                                        width: 3),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<AddtaskBloc>().add(
                                    PriorityColorEvent(
                                        isClicked: 3
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConstant.blueColor,
                                    border: Border.all(
                                        color: isClicked == 3
                                            ? Colors.blue.shade200
                                            : Colors.white,
                                        width: 3),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<AddtaskBloc>().add(
                                    PriorityColorEvent(
                                        isClicked: 4
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConstant.greenColor,
                                    border: Border.all(
                                        color: isClicked == 4
                                            ? Colors.green.shade200
                                            : Colors.white,
                                        width: 3),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstant.aNotification,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey.shade600),
                              ),
                              CupertinoSwitch(
                                value: _switchValue,
                                activeColor: Colors.deepPurple,
                                onChanged: (value) {
                                  setState(() {
                                    _switchValue = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_formkey.currentState!.validate()) {
            context.read<AddtaskBloc>().add(AddingTaskEvent(
              dateTime: datetimeController.text,
              description: descriptionController.text,
              category: categoryController.text,
              taskname: nameController.text,
              priority: isClicked,
              important: false,
              done: false,
              later: false,

            ));
            print("Validated");
            Navigator.of(context).pushNamed("/landingScreen");
            context.read<AddtaskBloc>().add(clearTextEvent(
                nameController: nameController,
                categoryController: categoryController,
                descriptionController: descriptionController,
                datetimeController: datetimeController));
          } else {
            print("Not Validated");
          }
        },
        child: Container(
          height: 50,
          color: Colors.deepPurple,
          child: const Center(
              child: Text(
                StringConstant.aAdd,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
