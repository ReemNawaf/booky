import 'package:booky_project/bloc/locale_bloc/locale_bloc.dart';
import 'package:booky_project/bloc/theme_bloc/theme_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:booky_project/auth/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAqQl1YJc3q5ar-qcpOtYV59RKzr5g6C9A",
      projectId: "booky-24220",
      messagingSenderId: "",
      appId: "1:162533253910:android:8d90c3eb2904d05853e637",
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => LocaleBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeUpdatedState>(
        builder: (context, state) {
          final themeData = state.themeData;
          return BlocBuilder<LocaleBloc, LocaleUpdatedState>(
            builder: (context, state) {
              return MaterialApp(
                  theme: themeData,
                  locale: state.locale,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  color: Colors.white,
                  home: const SplashView());
            },
          );
        },
      ),
    );
  }
}
