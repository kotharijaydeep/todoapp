part of 'addtask_bloc.dart';

@immutable
abstract class AddtaskEvent extends Equatable {
  AddtaskEvent();
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