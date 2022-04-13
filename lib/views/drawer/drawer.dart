import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/views/addpage/add_screens.dart';

import '../../core/stringconstant.dart';
import '../loginpage/auth/authentication.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({Key? key}) : super(key: key);

  @override
  _DrawerrState createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.deepPurple,
            child: Column(
              children:  const [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text("John Smith",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 20,
                ),
              ],

            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Column(
             children: [
               InkWell(
                 onTap: (){
                   Navigator.of(context).pushNamed('/taskview');
                 },
                 child: Row(
                   children: [
                     Image.asset("assets/landingscreen/add.png",width: 30,),
                     const SizedBox(
                       width: 20,
                     ),
                     const Text(StringConstant.dNewTask,style: TextStyle(fontSize: 18),)
                   ],
                 ),
               ),
               const SizedBox(
                 height: 20,
               ),
               Row(
                 children:  [
                   Image.asset("assets/landingscreen/star.png",width: 30,color: Colors.black,),
                   const SizedBox(
                     width: 20,
                   ),
                   const Text(StringConstant.dImportant,style: TextStyle(fontSize: 18),),

                 ],
               ),
               const SizedBox(
                 height: 20,
               ),
               Row(
                 children:  [
                   Image.asset("assets/landingscreen/checkdone.png",width: 30,color: Colors.black,),
                   const SizedBox(
                     width: 20,
                   ),
                   const Text(StringConstant.dDone,style: TextStyle(fontSize: 18),),

                 ],
               ),
               const SizedBox(
                 height: 20,
               ),
               Row(
                 children:  [
                   Image.asset("assets/landingscreen/time.png",width: 30,color: Colors.black,),
                   const SizedBox(
                     width: 20,
                   ),
                   const Text(StringConstant.dLater,style: TextStyle(fontSize: 18),),

                 ],
               ),
               const SizedBox(
                 height: 20,
               ),
               Row(
                 children:  [
                   Image.asset("assets/landingscreen/category.png",width: 30,color: Colors.black,),
                   const SizedBox(
                     width: 20,
                   ),
                   const Text(StringConstant.dCategory,style: TextStyle(fontSize: 18),),

                 ],
               ),
               const SizedBox(
                 height: 20,
               ),
               Row(
                 children:  [
                   Image.asset("assets/landingscreen/setting.png",width: 30,color: Colors.black,),
                   const SizedBox(
                     width: 20,
                   ),
                   const Text(StringConstant.dSetting,style: TextStyle(fontSize: 18),),

                 ],
               ),
               const SizedBox(
                 height: 20,
               ),
               InkWell(
                 onTap: ()async{
                   final prefs = await SharedPreferences.getInstance();
                   prefs.remove('email');
                   Auth().signOut(context);
                 },
                 child: Row(
                   children:  [
                     Image.asset("assets/landingscreen/logout.png",width: 30,color: Colors.black,),
                     const SizedBox(
                       width: 20,
                     ),
                     const Text(StringConstant.dLogout,style: TextStyle(fontSize: 18),),

                   ],
                 ),
               ),
             ],
            ),
          )
        ],
      ),
    );

  }
}
