part of 'daily_bloc.dart';

abstract class DailyEvent extends Equatable {
  const DailyEvent();
}


class GetDataInitial extends DailyEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class GetDataEvent  extends DailyEvent{

  List<Task> userprofileList = [];




  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
