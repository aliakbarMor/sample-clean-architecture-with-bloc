import 'package:eterex/core/res/api_response.dart';
import 'package:eterex/feature/login/domain/entities/login_request_entity.dart';

abstract class UserRepository {
  Future<ApiResponse<String>> login(LoginRequestEntity loginRequestEntity);

  saveToken(String token);

  String? loadToken();

  signOut();
}
