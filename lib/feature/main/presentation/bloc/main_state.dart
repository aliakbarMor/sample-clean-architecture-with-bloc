part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainSuccess extends MainState {
  final List<UserEntity> items;
  final int pages;
  final int currentPage;
  MainSuccess({
    required this.items,
    required this.pages,
    required this.currentPage,
  });
}

class MainError extends MainState {
  final String errorMessage;
  MainError(this.errorMessage);
}
