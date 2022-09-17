import 'package:bloc/bloc.dart';
import 'package:eterex/feature/main/domain/entities/user_entity.dart';
import 'package:eterex/feature/main/domain/use_cases/get_users_usecase.dart';
import 'package:eterex/feature/main/domain/use_cases/log_out_usecase.dart';
import 'package:eterex/feature/main/domain/use_cases/search_user_usecase.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetUsersUseCase _getUsersUseCase;
  final SearchUserUseCase _searchUserUseCase;
  final LogOutUseCase _logOutUseCase;

  List<UserEntity> users = [];
  int pages = 1;
  int currentPage = 1;

  MainBloc(this._getUsersUseCase, this._searchUserUseCase, this._logOutUseCase)
      : super(MainInitial()) {
    on<MainEvent>((event, emit) async {
      if (event is MainStarted) {
        emit(MainLoading());
        try {
          var res = await _getUsersUseCase.call(event.page);
          users = res.data?.data ?? [];
          pages = res.data?.totalPages ?? 1;
          currentPage = res.data?.page ?? 1;
          emit(MainSuccess(
              items: users, pages: pages, currentPage: currentPage));
        } catch (e) {
          emit(MainError('خطای نامشخص'));
        }
      } else if (event is MainSearch) {
        emit(MainSuccess(
            items: _searchUserUseCase.call(users, event.searchTerm),
            currentPage: currentPage,
            pages: pages));
      } else if (event is MainLogOut) {
        _logOutUseCase.call();
      }
    });
  }
}
