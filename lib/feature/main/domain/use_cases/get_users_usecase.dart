import 'package:eterex/core/res/api_response.dart';
import 'package:eterex/feature/main/domain/entities/users_entity.dart';
import 'package:eterex/feature/main/domain/repository/main_repository.dart';

class GetUsersUseCase {
  final MainRepository _mainRepository;
  GetUsersUseCase(this._mainRepository);

  Future<ApiResponse<UsersEntity>> call(int page) {
    return _mainRepository.getUsers(page);
  }
}
