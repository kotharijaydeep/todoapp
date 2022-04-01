part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HomeScreen extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class AuthSignUp extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class Error extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class Loding extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
