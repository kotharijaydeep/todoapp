import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../homepage/landing_screen.dart';
import '../auth/authentication.dart';
import '../login.dart';
import 'auth_bloc.dart';
import 'auth_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SigningEvent>((event, emit) async {
      await Auth().signIn(
          context: event.context, email: event.email, password: event.password);
      emit(HomeScreen());
    });

    on<SignUpEvent>((event, emit) {
      Auth().signUp(
        email: event.email,
        password: event.password,
        name: event.name,
        context: event.context,
      );

      emit(AuthLogin());
    });
    on<LoginInitial>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();







      var uid = prefs.getString('uid');


      if (uid== null) {
        emit(AuthLogin());
      } else {
        emit(HomeScreen());
      }
    });
  }
}
