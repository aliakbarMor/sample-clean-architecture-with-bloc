import 'package:eterex/feature/login/domain/entities/login_request_entity.dart';

class LoginRequestModel extends LoginRequestEntity {
  const LoginRequestModel({super.email, super.password});

  LoginRequestModel.mapper(LoginRequestEntity loginRequestEntity)
      : super(
            email: loginRequestEntity.email,
            password: loginRequestEntity.password);

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
