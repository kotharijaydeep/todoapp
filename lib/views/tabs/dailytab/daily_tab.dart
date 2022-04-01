import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/core/stringconstant.dart';

class DailyTab extends StatefulWidget {
  const DailyTab({Key? key}) : super(key: key);

  @override
  _DailyTabState createState() => _DailyTabState();
}

class _DailyTabState extends State<DailyTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:     SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset("assets/landingscreen/AlldoneLogo.png",width: 200),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(StringConstant.lAllDoneForNow,style: TextStyle(fontSize: 21,color: Colors.deepPurple,fontWeight: FontWeight.w900),),
              const SizedBox(
                height: 20,
              ),
              const Text(StringConstant.lNextTask,),
              const SizedBox(
                height: 5,
              ),
              const Text(StringConstant.lTomorrow355pm),
              const SizedBox(
                height: 10,
              ),
              const Text(StringConstant.lTimeForaBreak,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
