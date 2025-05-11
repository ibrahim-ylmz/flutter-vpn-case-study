import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/theme_bloc/theme_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/theme_bloc/theme_state.dart';

/// A BLoC that handles theme mode changes
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  /// Constructor for [ThemeBloc]
  ThemeBloc() : super(const ThemeState.light()) {
    on<ToggleThemeEvent>(_onToggleTheme);
  }

  /// A method that toggles the theme mode
  void _onToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) {
    if (state == const ThemeState.light()) {
      emit(const ThemeState.dark());
    } else {
      emit(const ThemeState.light());
    }
  }
}
