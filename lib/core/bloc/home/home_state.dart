part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class LoginSuccess extends HomeState {
  final String status;

  LoginSuccess(this.status);
}

class LoginFailed extends HomeState {
  final String error;

  LoginFailed(this.error);
}

class Loading extends HomeState {}

class Loaded extends HomeState {}
