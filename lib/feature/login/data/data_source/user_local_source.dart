import 'package:eterex/core/utils/constants.dart';
import 'package:get_storage/get_storage.dart';

class UserLocalSource {
  UserLocalSource();
  final GetStorage storage = GetStorage();

  saveToken(String token) {
    storage.write(Constants.token, token);
  }

  String? loadToken() {
    return storage.read(Constants.token);
  }

  signOut() {
    storage.remove(Constants.token);
  }
}
