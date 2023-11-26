
import 'package:booky_project/styles/app_styles.dart';
import 'package:flutter/material.dart';

import 'book_details_screen.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  _BookSearchScreenState createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _books = [];
  bool _loading = false;

  // TODO: functionality..

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
                  // TODO: onChanged
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: _loading
                            ? const CircularProgressIndicator(
                                color: AppColors.primaryColor,
                                backgroundColor: Colors.white,
                              )
                            : const Icon(Icons.search),
                        onPressed: _loading ? null : null // Call the function,
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
            Column(
              children: [
                Column(
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
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: const Text("Book Title"),
                      subtitle: const Text(
                        "Author name",
                        style: TextStyle(color: Color(0xFFA39C9C)),
                      ),
                      leading: Container(
                        width: 50,
                        height: 150,
                        child:
                        "link" != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                             'https://picsum.photos/250?image=9',
                                ),
                              )
                            : Container(),
                      ),
                      //TODO: go to book details page
                      onTap: (){

Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookDetailsScreen()));

                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
