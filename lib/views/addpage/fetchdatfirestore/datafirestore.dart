import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('addtask');

  createUserData(String taskname, String description, String category, String datetime) async {
    return await profileList.add({
      'taskname': taskname,
      'description': description,
      'category': category,
      'datetime':datetime,
    }).then((value) => print("task add")).catchError((error)=> print("Failed to Add Task"));
  }

  getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
