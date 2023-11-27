import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<ChangeLocaleEvent, LocaleUpdatedState> {
  LocaleBloc() : super(LocaleUpdatedState(const Locale('en'))) {
    on<ChangeLocaleEvent>((event, emit) {
      if (event.isEnglish) {
        emit(LocaleUpdatedState(const Locale('en')));
      } else {
        emit(LocaleUpdatedState(const Locale('ar')));
      }
    });
  }
}
