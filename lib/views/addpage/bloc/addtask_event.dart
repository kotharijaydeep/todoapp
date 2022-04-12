part of 'addtask_bloc.dart';

@immutable
abstract class AddtaskEvent extends Equatable {
  AddtaskEvent();
}

class InitialAddTaskEvent extends AddtaskEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class AddingTaskEvent extends  AddtaskEvent{


  final String taskname;
  final String description;
  final String category;
  final String dateTime;

  AddingTaskEvent({required this.taskname, required this.description, required this.category, required this.dateTime, });


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class clearTextEvent extends AddtaskEvent{

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController categoryController ;
  final TextEditingController datetimeController;

  clearTextEvent({required this.nameController, required this.descriptionController, required this.categoryController, required this.datetimeController});


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();



}
class PriorityColorEvent extends AddtaskEvent{

 final int isClicked;

  PriorityColorEvent({required this.isClicked});



  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();



}