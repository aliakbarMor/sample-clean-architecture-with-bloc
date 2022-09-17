import 'package:eterex/feature/login/domain/repository/user_repository.dart';

class LogOutUseCase {
  final UserRepository _repository;
  LogOutUseCase(this._repository);

  void call() {
    _repository.signOut();
  }
}
