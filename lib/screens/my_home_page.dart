import 'package:flutter/material.dart';
import 'package:namer_app/screens/generator_page.dart';
import 'package:namer_app/screens/favorites_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Who is your favourite dog?',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Row(
        children: [
          NavigationRail(
            extended: false,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text('Favorites'),
              ),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
          ),
          Expanded(
            child: Container(
              child: _getPage(selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return GeneratorPage();
      case 1:
        return FavoritesPage();
      default:
        return Container();
    }
  }
}
