part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class LoginClicked extends HomeEvent {
  final String username;
  final String password;

  LoginClicked(this.username, this.password);
}
