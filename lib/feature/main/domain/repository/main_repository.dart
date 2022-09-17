import 'package:eterex/core/res/api_response.dart';
import 'package:eterex/feature/main/domain/entities/users_entity.dart';

abstract class MainRepository {
  Future<ApiResponse<UsersEntity>> getUsers(int page);
}
