part of 'daily_bloc.dart';

abstract class DailyState extends Equatable {
  const DailyState();
}

class DailyInitial extends DailyState {
  @override
  List<Object> get props => [];
}


class GetDataState extends DailyState{

final List<Task> userprofileList;

  GetDataState({required this.userprofileList});


  @override
  // TODO: implement props
  List<Object?> get props => [];


}
class ImportantState extends DailyState{

  final List<Task> userprofileList;

  ImportantState({required this.userprofileList});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}