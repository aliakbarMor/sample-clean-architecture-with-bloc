part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class Login extends LoginState {}

class SignUp extends LoginState {}

class Loading extends LoginState {}

class GoToMainScreen extends LoginState {}
