import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Map<String, String> article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title']!),
      ),
      body: Container(
        color: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Author: ${article['author']!}'),
        ),
      ),
    );
  }
}
