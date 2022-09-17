part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class MainStarted extends MainEvent {
  final int page;
  MainStarted(this.page);
}

class MainSearch extends MainEvent {
  final String searchTerm;
  MainSearch(this.searchTerm);
}

class MainLogOut extends MainEvent {
  MainLogOut();
}
