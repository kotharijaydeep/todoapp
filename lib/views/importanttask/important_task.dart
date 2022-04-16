import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/stringconstant.dart';
import 'package:todoapp/views/tabs/dailytab/bloc/daily_bloc.dart';

import '../../core/colorconstant.dart';


class Important extends StatefulWidget {
  const Important({Key? key}) : super(key: key);

  @override
  _ImportantState createState() => _ImportantState();
}

class _ImportantState extends State<Important> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.important),
      ),
        body: BlocProvider(
        create: (_)=> DailyBloc()..add(ImportantEvent()),
        child: BlocConsumer<DailyBloc,DailyState>(
          builder: (_, state) {
            if(state is ImportantState){
              return   Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.userprofileList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Text(state.userprofileList[index].datetime,style: TextStyle(color: Colors.black),),
                          title: Text(state.userprofileList[index].taskname),
                          subtitle: Text(state.userprofileList[index].description),
                          trailing: Container(
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
                        ),
                      );
                    },)
                ],
              );
            }else{
              return Container();
            }
          },
            listener: (BuildContext context, Object? state) {}
        ),
        ),

    );
  }
}
