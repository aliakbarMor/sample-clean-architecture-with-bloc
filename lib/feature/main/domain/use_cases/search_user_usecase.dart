import 'package:eterex/feature/main/domain/entities/user_entity.dart';

class SearchUserUseCase {
  SearchUserUseCase();

  List<UserEntity> call(List<UserEntity> items, String searchKey) {
    return items
        .where((e) =>
            (e.firstName?.contains(searchKey) ?? false) ||
            (e.lastName?.contains(searchKey) ?? false) ||
            (e.email?.contains(searchKey) ?? false))
        .toList();
  }
}
