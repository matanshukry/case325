import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  final Map<String, String> book;

  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['title']!),
      ),
      body: Container(
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Author: ${book['author']!}'),
        ),
      ),
    );
  }
}
