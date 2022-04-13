import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/colorconstant.dart';
import 'package:todoapp/core/stringconstant.dart';

import '../addpage/bloc/addtask_bloc.dart';



class EditTask extends StatefulWidget {
  const EditTask({Key? key}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {

 int isClicked = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.scaffoldColor,
      appBar: AppBar(
        title: Text(StringConstant.editTask,style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: ColorConstant.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Task Name",style: TextStyle(fontSize: 15,color: ColorConstant.greyColor),),
                      Text("Jaydeep Kothari",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Description",style: TextStyle(fontSize: 15,color: ColorConstant.greyColor),),
                      SizedBox(height: 5,),
                      Text("heelo awlcome asreere the jsdujhj njjasdf jbhhsdk jbhsdas ",style: TextStyle(fontSize: 17,color: ColorConstant.blackColor),),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Cetegory",style: TextStyle(fontSize: 15,color: ColorConstant.greyColor),),
                      SizedBox(height: 5,),
                      Text("Friend",style: TextStyle(fontSize: 17,color: ColorConstant.blackColor),),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Pick Date & Time",style: TextStyle(fontSize: 15,color: ColorConstant.greyColor),),
                      SizedBox(height: 5,),
                      Text("27-04-2022 | 5:50",style: TextStyle(fontSize: 17,color: ColorConstant.blackColor),),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Text("Priority",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
              Container(
                color: ColorConstant.whiteColor,
               width: double.infinity,
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                   ],
                 ),
               ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar:  InkWell(
        onTap: (){},
        child: Container(
          height: 50,
          color: Colors.deepPurple,
          child: const Center(
              child: Text(
                StringConstant.edit,
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
