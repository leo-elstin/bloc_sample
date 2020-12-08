import 'package:bloc_sample/core/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({this.provider}) : super(Loaded());

  LoginRepository provider;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoginClicked) {
      yield Loading();

      String status = await provider.doLogin(
        password: event.password,
        username: event.username,
      );

      if (status == 'Success') {
        yield LoginSuccess('Success');
      } else {
        yield LoginFailed(('Invalid details'));
      }
    }
  }
}
