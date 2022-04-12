import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp/views/tabs/dailytab/daily_tab.dart';
import 'package:todoapp/views/tabs/dailytab/getmodel/getmodel.dart';

import '../../../addpage/fetchdatfirestore/datafirestore.dart';

part 'daily_event.dart';

part 'daily_state.dart';

class DailyBloc extends Bloc<DailyEvent, DailyState> {
  DailyBloc() : super(DailyInitial()) {
    on<DailyEvent>((event, emit) {
      // TODO: implement event handler
    }
    );

    on<GetDataEvent>((event, emit) async {

      dynamic result = await DatabaseManager().getUsersList();
       print(result.toString());
      if (result == null) {
        print("unable to retive");
      } else {
        emit(GetDataState(userprofileList:result));
      }
    });
  }
}
