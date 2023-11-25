
import 'package:booky_project/home/book_search_screen.dart';
import 'package:booky_project/service/book_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final BookService bookService =
      BookService('AIzaSyAZ63Qzt0AvIXDvfqNmPbyz5bzN-lEGWE8');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        body: BookSearchScreen(bookService: bookService),
      ),
    );
  }
}
