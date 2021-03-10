import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OfflineStorage {
  final storage = new FlutterSecureStorage();
  final AUTH_TOKEN_KEY = "auth-token";

  void writeToken(String authToken) async {
    await storage.write(key: AUTH_TOKEN_KEY, value: authToken);
  }

  Future<String> readToken() async {
    String key = await storage.read(key: AUTH_TOKEN_KEY);
    return key;
  }
}
