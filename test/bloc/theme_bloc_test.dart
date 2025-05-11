import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/theme_bloc/theme_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/theme_bloc/theme_state.dart';

void main() {
  group('ThemeBloc', () {
    late ThemeBloc themeBloc;

    setUp(() {
      themeBloc = ThemeBloc();
    });

    tearDown(() {
      themeBloc.close();
    });

    test('initial state is light theme', () {
      expect(themeBloc.state, const ThemeState.light());
    });

    blocTest<ThemeBloc, ThemeState>(
      'emits [ThemeState.dark()] when ToggleThemeEvent is added in light theme',
      build: () => themeBloc,
      act: (bloc) => bloc.add(const ToggleThemeEvent()),
      expect: () => [const ThemeState.dark()],
    );

    blocTest<ThemeBloc, ThemeState>(
      'emits [ThemeState.light()] when ToggleThemeEvent is added in dark theme',
      build: () {
        final darkThemeBloc = ThemeBloc()..add(const ToggleThemeEvent());
        return darkThemeBloc;
      },
      skip: 1,
      act: (bloc) => bloc.add(const ToggleThemeEvent()),
      expect: () => [const ThemeState.light()],
    );
  });
}
