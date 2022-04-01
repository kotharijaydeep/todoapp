import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/views/addpage/fetchdatfirestore/datafirestore.dart';

part 'addtask_event.dart';
part 'addtask_state.dart';

class AddtaskBloc extends Bloc<AddtaskEvent, AddtaskState> {
  AddtaskBloc() : super(AddtaskInitial()) {
    on<AddtaskEvent>((event, emit) {
      // TODO: implement event handler
    }
    );
    on<AddingTaskEvent>((event, emit) async{
    await DatabaseManager().createUserData(
        event.taskname,
        event.description,
        event.category,
        event.dateTime,
     );
    });
  }
}
