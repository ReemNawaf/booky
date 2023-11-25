import 'package:booky_project/home/book_details_screen.dart';
import 'package:booky_project/service/book_service.dart';
import 'package:booky_project/styles/app_styles.dart';
import 'package:flutter/material.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  _BookSearchScreenState createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _books = [];
  bool _loading = false;

  // functionality

  _searchBooks()async {
    final query = _searchController.text.trim();

    if (query.isNotEmpty) {
      setState(() {
        _loading = true;
      });
    await  BookService().searchBooks(query).then((data) {
        setState(() {
          _books = data['items'] ?? [];
          _loading = false;
        });
      }).catchError((error) {
        print(error);
        setState(() {
          _loading = false;
        });
      });
    }
  }

  query(String query) {
    if (_searchController.text.trim().isEmpty || query.trim().isEmpty) {
      setState(() {
        _books = [];
      });
      return;
    }
  }

  void _viewBookDetails(dynamic book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsScreen(book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Center(
          child: Image.asset(
            "assets/logo/logo_without_text_light.png",
            height: 60,
          ),
        ),
        actions: const <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: null,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _searchController,
                  onChanged: query,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: _loading
                          ? const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                              backgroundColor: Colors.white,
                            )
                          : const Icon(Icons.search),
                      onPressed: _loading ? null : _searchBooks,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search for a Book...',
                    hintStyle: const TextStyle(
                      color: Color(0xFFA39C9C),
                    ),
                  ),
                ),
              ),
            ),
            _books.length == 0
                ? Column(
                    children: [
                      Image.asset(
                        "assets/icons/search.png",
                        height: 350,
                      ),
                      const Text(
                        "Start searching for your book",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      )
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _books.length,
                    itemBuilder: (context, index) {
                      final book = _books[index];
                      final volumeInfo = book['volumeInfo'];
                      final imageLinks = volumeInfo['imageLinks'];
                      return ListTile(
                        title: Text(volumeInfo['title']),
                        subtitle: Text(
                          volumeInfo['authors']?.join(', ') ?? 'Unknown Author',
                          style: TextStyle(color: Color(0xFFA39C9C)),
                        ),
                        leading: Container(
                          width: 50,
                          height: 150,
                          child: imageLinks != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    imageLinks['thumbnail'] ?? '',
                                  ),
                                )
                              : Container(),
                        ),
                        onTap: () => _viewBookDetails(book),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
