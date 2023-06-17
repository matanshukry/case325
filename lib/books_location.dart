import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'books.dart';
import 'books_details_screen.dart';
import 'books_screen.dart';

class BooksLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/books/:bookId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('books'),
          title: 'Books',
          // type: BeamPageType.noTransition,
          child: BooksScreen(),
        ),
        if (state.pathParameters.containsKey('bookId'))
          BeamPage(
            key: ValueKey('book-${state.pathParameters['bookId']}'),
            title: books.firstWhere((book) =>
                book['id'] == state.pathParameters['bookId'])['title'],
            child: BookDetailsScreen(
              book: books.firstWhere(
                  (book) => book['id'] == state.pathParameters['bookId']),
            ),
          ),
      ];

  static BeamPage build([String? bookId]) {
    if (bookId != null) {
      return BeamPage(
        key: ValueKey('book-$bookId'),
        title: books.firstWhere((book) => book['id'] == bookId)['title'],
        child: BookDetailsScreen(
          book: books.firstWhere((book) => book['id'] == bookId),
        ),
      );
    }

    return const BeamPage(
      key: ValueKey('books'),
      title: 'Books',
      // type: BeamPageType.noTransition,
      child: BooksScreen(),
    );
  }
}
