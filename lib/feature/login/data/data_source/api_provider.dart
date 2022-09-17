import 'package:dio/dio.dart';
import 'package:eterex/core/utils/constants.dart';
import 'package:eterex/feature/login/data/model/login_request_model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<Response> login(LoginRequestModel loginRequest) async {
    return _dio.post(
      '${Constants.baseUrl}api/login',
      data: loginRequest.toJson(),
    );
  }
}
