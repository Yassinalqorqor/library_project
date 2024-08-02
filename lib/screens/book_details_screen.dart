import 'package:flutter/material.dart';
import 'package:library_project/core/app_core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/library_book_model.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({
    super.key,
    required this.bookdetails,
  });
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final BookModel bookdetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Details',
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Image.network(
                  bookdetails.image!,
                  height: 200,
                  width: 150,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                bookdetails.title!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                bookdetails.author!,
                style: const TextStyle(
                    fontSize: 10, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${bookdetails.pages!}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    bookdetails.language!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    bookdetails.publishedDate!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                bookdetails.description!,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal),
              )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _launchURL(
                      bookdetails.webview!);
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.redAccent),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Adjust the radius for more/less curve
                    ),
                  ),
                  minimumSize: WidgetStateProperty.all<Size>(
                      const Size(250, 50)), // Set the button size
                ),
                child: const Text(
                  'Subscribe Book',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
