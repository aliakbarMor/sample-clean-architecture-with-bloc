part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OnLoginClick extends LoginEvent {}

class OnChangeStatusClick extends LoginEvent {}

class ChangePass extends LoginEvent {
  final String pass;
  ChangePass(this.pass);
}

class ChangeEmail extends LoginEvent {
  final String email;
  ChangeEmail(this.email);
}
