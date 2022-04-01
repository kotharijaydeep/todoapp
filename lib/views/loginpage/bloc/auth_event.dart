part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

}
class LoginInitial extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class SigningEvent extends AuthEvent{
  final BuildContext context;
  final String email;
  final String password;

  SigningEvent({required this.email, required this.password,required this.context});


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}

class SignUpEvent extends AuthEvent{
  final BuildContext context;
  final String name;
  final String email;
  final String password;
  final String confirmpassword;

  SignUpEvent({required this.name, required this.email,required this.password,required this.confirmpassword,required this.context});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
