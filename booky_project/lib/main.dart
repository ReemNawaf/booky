import 'package:flutter/material.dart';
import 'package:booky_project/auth/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
//todo: this is the plugins in build.gradle
  //  id "com.android.application"
  //   id "kotlin-android"
  //   id "dev.flutter.flutter-gradle-plugin"
  //   id "com.google.gms.google-services"
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
