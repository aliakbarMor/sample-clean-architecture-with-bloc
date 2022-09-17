import 'package:eterex/feature/login/data/data_source/api_provider.dart'
    as login;
import 'package:eterex/feature/login/data/data_source/user_local_source.dart';
import 'package:eterex/feature/login/data/repository/user_repositoryimpl.dart';
import 'package:eterex/feature/login/domain/repository/user_repository.dart';
import 'package:eterex/feature/login/domain/use_cases/login_usecase.dart';
import 'package:eterex/feature/login/presentation/bloc/login_bloc.dart';
import 'package:eterex/feature/main/data/data_source/api_provider.dart' as main;
import 'package:eterex/feature/main/data/repository/main_repositoryimpl.dart';
import 'package:eterex/feature/main/domain/repository/main_repository.dart';
import 'package:eterex/feature/main/domain/use_cases/get_users_usecase.dart';
import 'package:eterex/feature/main/domain/use_cases/log_out_usecase.dart';
import 'package:eterex/feature/main/domain/use_cases/search_user_usecase.dart';
import 'package:eterex/feature/main/presentation/bloc/main_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setup() async {
  locator.registerSingleton<login.ApiProvider>(login.ApiProvider());
  locator.registerSingleton<UserLocalSource>(UserLocalSource());
  locator.registerSingleton<UserRepository>(
      UserRepositoryImpl(locator(), locator()));
  locator.registerSingleton<LoginUseCase>(LoginUseCase(locator()));
  locator.registerFactory<LoginBloc>(() => LoginBloc(locator()));

  locator.registerSingleton<main.ApiProvider>(main.ApiProvider());
  locator.registerSingleton<MainRepository>(MainRepositoryImpl(locator()));
  locator.registerSingleton<GetUsersUseCase>(GetUsersUseCase(locator()));
  locator.registerSingleton<SearchUserUseCase>(SearchUserUseCase());
  locator.registerSingleton<LogOutUseCase>(LogOutUseCase(locator()));
  locator
      .registerSingleton<MainBloc>(MainBloc(locator(), locator(), locator()));
}
