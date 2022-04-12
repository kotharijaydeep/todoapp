part of 'addtask_bloc.dart';

@immutable
abstract class AddtaskState extends Equatable {
  AddtaskState();
}

class AddtaskInitial extends AddtaskState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AddingtaskState extends AddtaskState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class PriorityState extends AddtaskState{

   final int isClicked;

  PriorityState({required this.isClicked});

  @override
  // TODO: implement props
  List<Object?> get props => [isClicked];

}