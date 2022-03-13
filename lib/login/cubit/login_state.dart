part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}


class LoginProcessing extends LoginState{}

class LoginFailed extends LoginState{
  String error;

  LoginFailed(this.error);
}

class LoginSuccess extends LoginState{
  String userName;

  LoginSuccess(this.userName);
}
