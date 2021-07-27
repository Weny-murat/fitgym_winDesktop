import 'package:appwrite/appwrite.dart';

class Networker {
  final Client client = Client();

  init() {
    client
        .setEndpoint('https://192.168.1.46/v1')
        .setProject('60ec94eb302df')
        .setSelfSigned();
  }

  Future userRegister({
    required String email,
    required String password,
  }) async {
    final Account account = Account(client);
    try {
      final response = await account.create(
        email: email,
        password: password,
      );
      print(response.data.runtimeType);
      return response.statusCode;
    } on AppwriteException catch (e) {
      return e.code;
    }
  }
}
