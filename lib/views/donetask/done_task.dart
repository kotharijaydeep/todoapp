import 'package:flutter/material.dart';
import 'package:todoapp/core/stringconstant.dart';


class DoneTask extends StatefulWidget {
  const DoneTask({Key? key}) : super(key: key);

  @override
  _DoneTaskState createState() => _DoneTaskState();
}

class _DoneTaskState extends State<DoneTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.donetask),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            height: 60,
            child: Column(
              children: [
                Container(
                  height: 50,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
