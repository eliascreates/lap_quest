import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeState.dark);

  void toggleTheme() {
    emit(state == ThemeState.dark ? ThemeState.light : ThemeState.dark);
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.values[json['index'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) => {'index': state.index};
}
