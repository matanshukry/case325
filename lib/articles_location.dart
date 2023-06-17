import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'articles.dart';
import 'articles_details_screen.dart';
import 'articles_screen.dart';

class ArticlesLocation {
  static BeamPage build(GlobalKey<BeamerState> key) {
    return BeamPage(
      key: const ValueKey('articles'),
      title: 'Articles',
      // type: BeamPageType.noTransition,
      child: ArticlesScreen(key),
    );
  }

  static BeamPage buildSpecific(String articleId) {
    return BeamPage(
      key: ValueKey('articles-$articleId'),
      title:
          articles.firstWhere((article) => article['id'] == articleId)['title'],
      child: ArticleDetailsScreen(
        article: articles.firstWhere((article) => article['id'] == articleId),
      ),
    );
  }
}
