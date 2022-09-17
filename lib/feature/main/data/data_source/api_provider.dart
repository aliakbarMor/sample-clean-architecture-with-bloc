import 'package:dio/dio.dart';
import 'package:eterex/core/utils/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<dynamic> getUsers(int page) async {
    var response = await _dio.get(
      '${Constants.baseUrl}api/users?page=$page',
    );
    return response;
  }
}
