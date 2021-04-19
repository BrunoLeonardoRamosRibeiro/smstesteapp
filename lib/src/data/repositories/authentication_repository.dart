import 'package:smstesteapp/src/data/providers/local/authentication_client.dart';

abstract class AuthenticationRepository {
  Future<String> get accessToken;
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationClient _client;
  AuthenticationRepositoryImpl(this._client);

  @override
  Future<String> get accessToken => _client.accessToken;

}