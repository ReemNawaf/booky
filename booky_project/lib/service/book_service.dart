import 'dart:convert';
import 'package:http/http.dart' as http;

class BookService {
 final String apiKey =
      'AIzaSyAZ63Qzt0AvIXDvfqNmPbyz5bzN-lEGWE8';
  Future<Map<String, dynamic>> searchBooks(String query) async {
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=$query&key=$apiKey'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load books');
    }
  }
}




