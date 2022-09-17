import 'package:eterex/core/res/api_response.dart';
import 'package:eterex/feature/login/domain/entities/login_request_entity.dart';
import 'package:eterex/feature/login/domain/repository/user_repository.dart';

class LoginUseCase {
  final UserRepository _loginRepository;
  LoginUseCase(this._loginRepository);

  Future<ApiResponse<String>> call(LoginRequestEntity loginRequestEntity) {
    return _loginRepository.login(loginRequestEntity);
  }
}
