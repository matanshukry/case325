import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'articles.dart';

class ArticlesScreen extends StatelessWidget {
  final GlobalKey<BeamerState> beamerKey;

  const ArticlesScreen(this.beamerKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Articles')),
      body: Container(
        color: Colors.blue,
        child: ListView(
          children: articles
              .map(
                (article) => ListTile(
                  title: Text(article['title']!),
                  subtitle: Text(article['author']!),
                  onTap: () => beamerKey.currentContext?.beamToNamed('/articles/${article['id']}'),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
