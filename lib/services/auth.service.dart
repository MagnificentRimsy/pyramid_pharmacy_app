import 'package:pyramid_pharmacy/models/user.dart';
import 'package:pyramid_pharmacy/repositories/repository.dart';

class AuthService {
  Repository _repository;

  AuthService() {
    _repository = Repository();
  }

  signIn(String email, String password) async {
    var data = {'email': email, 'password': password};
    var _result = await _repository.httpPost('login', data, '');
    return _result;
  }

  signOut() async {
    return await _repository.httpPost('logout', new User(), '');
  }
}
