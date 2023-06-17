import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'articles_location.dart';
import 'books_location.dart';
import 'bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _beamerKey = GlobalKey<BeamerState>();
  late final _routerDelegate = BeamerDelegate(
    buildListener: (context, delegate) {
      debugPrint(
          'Nested Building to ${delegate.configuration.location}. History: ${delegate.currentBeamLocation.history.map((e) => e.routeInformation.location).toList(growable: false)}');
    },
    routeListener: (route, delegate) {
      debugPrint(
          'Nested Routing to ${route.location}. History: ${delegate.currentBeamLocation.history.map((e) => e.routeInformation.location).toList(growable: false)}');
    },
    locationBuilder: RoutesLocationBuilder(routes: {
      '/books': (ctx, state, data) => BooksLocation.build(),
      '/books/:bookId': (ctx, state, data) =>
          BooksLocation.build(state.pathParameters['bookId']),
      '/articles': (ctx, state, data) => ArticlesLocation.build(_beamerKey),
      // '/articles/:articleId': (ctx, state, data) => ArticlesLocation.build(state.pathParameters['articleId']),
    }),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Beamer(
        key: _beamerKey,
        routerDelegate: _routerDelegate,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        beamerKey: _beamerKey,
      ),
    );
  }
}
