import 'package:bloc_sample/core/login_repository.dart';

class LoginProvider extends LoginRepository {
  @override
  Future<String> doLogin({username, password}) async {
    await Future.delayed(Duration(seconds: 30));
    if (username == 'leoelstin' && password == 'leoelstin') {
      return 'Success';
    } else {
      return 'Invalid details';
    }
  }
}
