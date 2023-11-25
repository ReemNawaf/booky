import 'package:firebase_core/firebase_core.dart';
import 'package:booky_project/auth/views/splash_view.dart';
import 'package:booky_project/home/book_search_screen.dart';
import 'package:booky_project/service/book_service.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options:const FirebaseOptions(
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: SplashView()
    );
  }
}
