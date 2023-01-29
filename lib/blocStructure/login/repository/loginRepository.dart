

import '../../../networkModule/apiProvider.dart';

class UserRepository {
  final ApiProvider _signInApiProvider = ApiProvider();
  Future<dynamic> signIn({String? email, String? password, String? url}) async {
    return await _signInApiProvider.loginCall(
        url: url, email: email, password: password);
  }
}
