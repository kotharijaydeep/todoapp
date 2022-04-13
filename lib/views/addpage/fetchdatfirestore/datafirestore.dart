import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import '../../tabs/dailytab/getmodel/getmodel.dart';

class DatabaseManager {
  final CollectionReference task =
      FirebaseFirestore.instance.collection('addtask');

  createUserData(String taskname, String description, String category,
      String datetime,int priority, bool important, bool done,bool later) async {
    return await task
        .add({
          'taskname': taskname,
          'description': description,
          'category': category,
          'datetime': datetime,
          'priority': priority,
          'important': important,
          'done': done,
          'later': later,

        })
        .then((value) => print("task add"))
        .catchError((error) => print("Failed to Add Task"));
  }

/*
 Stream<List> getUsersList() {
    return task .snapshots().map((event){
      return event.docs.map((e) => Task.fromSnapshot(e)).toList();
    })
 }
 }
*/

  getUsersList() async {
    List<Task> itemsList = [];

    try {
      await task.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(Task.fromJson(element.data()));
          print(task);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
