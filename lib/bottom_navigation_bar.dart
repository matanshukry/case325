import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key, required this.beamerKey});

  final GlobalKey<BeamerState> beamerKey;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex =
        _beamerDelegate.configuration.location!.contains('books') ? 0 : 1;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(label: 'Books', icon: Icon(Icons.book)),
        BottomNavigationBarItem(label: 'Articles', icon: Icon(Icons.article)),
      ],
      onTap: (index) {
        _beamerDelegate.beamToNamed(
          index == 0 ? '/books' : '/articles',
        );
      },
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
