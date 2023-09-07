part of 'home_cubit.dart';

enum HomeTab { activities, settings }

class HomeState extends Equatable {
  const HomeState({this.tab = HomeTab.activities});

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
