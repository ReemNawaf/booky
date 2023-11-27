import 'package:booky_project/styles/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ChangeThemeEvent, ThemeUpdatedState> {
  ThemeBloc() : super(ThemeUpdatedState(lightTheme)) {
    on<ChangeThemeEvent>((event, emit) {
      if (event.isDark) {
        emit(ThemeUpdatedState(darkTheme));
      } else {
        emit(ThemeUpdatedState(lightTheme));
      }
    });
  }
}
