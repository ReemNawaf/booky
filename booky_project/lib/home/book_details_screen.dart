import 'package:booky_project/styles/app_styles.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  // final dynamic book;
  const BookDetailsScreen();

  @override
  Widget build(BuildContext context) {
    // final volumeInfo = book['volumeInfo'];
    // final imageLinks = volumeInfo['imageLinks'];

    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black,
                  ),
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Text(
                "Book Details",
              ),
              const Image(
                image: AssetImage("assets/logo/logo_without_text_light.png"),
                width: 36,
                height: 36,
              ),
            ],
          )),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if (imageLinks != null)
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://picsum.photos/250?image=9',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    "Book title",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Authtor name",
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xFFA39C9C)),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        'Number of pages:',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFA39C9C)),
                      ),
                      Text(
                        "pageCount",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        ' Language:',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFA39C9C)),
                      ),
                      Text(
                        'language',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Description:",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'description',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
