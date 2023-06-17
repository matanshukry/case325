import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'articles_location.dart';
import 'home_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routerDelegate = BeamerDelegate(
    initialPath: '/articles',
    buildListener: (context, delegate) {
      debugPrint(
          'Building to ${delegate.configuration.location}. History: ${delegate.currentBeamLocation.history.map((e) => e.routeInformation.location).toList(growable: false)}');
    },
    routeListener: (route, delegate) {
      debugPrint(
          'Routing to ${route.location}. History: ${delegate.currentBeamLocation.history.map((e) => e.routeInformation.location).toList(growable: false)}');
    },
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // '*': (context, state, data) => HomeScreen(),
        '/books': (context, state, data) => HomeScreen(),
        '/books/*': (context, state, data) => HomeScreen(),
        '/articles': (context, state, data) => HomeScreen(),
        // '/articles/*': (context, state, data) => HomeScreen(),

        // '/chat/*':
        '/articles/:articleId': (ctx, state, data) =>
            ArticlesLocation.buildSpecific(state.pathParameters['articleId']!),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}
