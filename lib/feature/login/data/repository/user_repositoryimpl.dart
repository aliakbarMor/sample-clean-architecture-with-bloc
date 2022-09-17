import 'package:dio/dio.dart';
import 'package:eterex/core/res/api_response.dart';
import 'package:eterex/core/utils/token_container.dart';
import 'package:eterex/feature/login/data/data_source/api_provider.dart';
import 'package:eterex/feature/login/data/data_source/user_local_source.dart';
import 'package:eterex/feature/login/data/model/login_request_model.dart';
import 'package:eterex/feature/login/domain/entities/login_request_entity.dart';
import 'package:eterex/feature/login/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final ApiProvider _api;
  final UserLocalSource _localSource;

  UserRepositoryImpl(this._api, this._localSource);

  @override
  Future<ApiResponse<String>> login(
      LoginRequestEntity loginRequestEntity) async {
    try {
      final Response response =
          await _api.login(LoginRequestModel.mapper(loginRequestEntity));
      final String token = response.data['token'];
      saveToken(token);
      return ApiSuccess(token);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 400) {
          return const ApiFailed("Username or password is Wrong");
        } else {
          return const ApiFailed("Something Went Wrong. try again...");
        }
      } else {
        return const ApiFailed("please check your connection...");
      }
    }
  }

  @override
  saveToken(String token) {
    _localSource.saveToken(token);
    TokenContainer.updateToken(token);
  }

  @override
  String? loadToken() {
    var token = _localSource.loadToken();
    TokenContainer.updateToken(token);
    return token;
  }

  @override
  signOut() {
    _localSource.signOut();
    TokenContainer.updateToken(null);
  }
}
