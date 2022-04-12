// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  String datetime;
  String description;
  String taskname;
  String category;

  Task({
    required this.datetime,
    required this.description,
    required this.taskname,
    required this.category,
  });

  factory Task.fromJson(dynamic json) => Task(
    datetime: json["datetime"],
    description: json["description"],
    taskname: json["taskname"],
    category: json["category"],
  );

  dynamic toJson() => {
    "datetime": datetime,
    "description": description,
    "taskname": taskname,
    "category": category,
  };
}
