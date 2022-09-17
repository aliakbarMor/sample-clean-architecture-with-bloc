import 'package:dio/dio.dart';
import 'package:eterex/core/res/api_response.dart';
import 'package:eterex/feature/main/data/data_source/api_provider.dart';
import 'package:eterex/feature/main/data/model/users_model.dart';
import 'package:eterex/feature/main/domain/entities/users_entity.dart';
import 'package:eterex/feature/main/domain/repository/main_repository.dart';

class MainRepositoryImpl extends MainRepository {
  final ApiProvider _api;
  MainRepositoryImpl(this._api);

  @override
  Future<ApiResponse<UsersEntity>> getUsers(int page) async {
    try {
      final Response response = await _api.getUsers(page);

      final UsersEntity usersEntity = UsersModel.fromJson(response.data);
      return ApiSuccess(usersEntity);
    } catch (e) {
      if (e is DioError) {
        return const ApiFailed("Something Went Wrong. try again...");
      } else {
        return const ApiFailed("please check your connection...");
      }
    }
  }
}
