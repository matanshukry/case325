import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'books.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: Container(
        color: Colors.red,
        child: ListView(
          children: books
              .map(
                (book) => ListTile(
                  title: Text(book['title']!),
                  subtitle: Text(book['author']!),
                  onTap: () => context.beamToNamed('/books/${book['id']}'),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
