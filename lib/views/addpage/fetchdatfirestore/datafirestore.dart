import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import '../../tabs/dailytab/getmodel/getmodel.dart';

var uuid = Uuid();

class DatabaseManager {
  CollectionReference task = FirebaseFirestore.instance.collection('addtask');

  createUserData(
      String taskname,
      String description,
      String category,
      String datetime,
      int priority,
      bool important,
      bool done,
      bool later) async {
    final docId = uuid.v4();
    print("uuid : ${docId}");

    String result = datetime.substring(0, datetime.indexOf(' '));
    var time = datetime.replaceAll(result, '');
    var removespace = time.replaceAll(" ", '');
    print(result);

    return await task
        .doc(docId)
        .set({
          'taskname': taskname,
          'description': description,
          'category': category,
          'datetime': datetime,
          'date': result,
          'time': removespace,
          'priority': priority,
          'important': important,
          'done': done,
          'later': later,
          'docId': docId
        })
        .then((value) => print("task add"))
        .catchError((error) => print("Failed to Add Task"));
  }

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


  importantList() async {
    List<Task> itemsList = [];

    try {
      await task.where('important',isEqualTo: true).get().then((querySnapshot) {
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
