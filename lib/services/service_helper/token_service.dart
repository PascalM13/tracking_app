import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Helperclass to validate Token of FlutterSecureStorage
///
/// @author: PascalM13
class TokenService {
  bool status = false;

  Future<void> _validateToken() async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'access_token');
    if (token != null) {
      status = true;
    } else {
      status = false;
    }
  }

  bool validateToken() {
    _validateToken();
    return status;
  }
}
