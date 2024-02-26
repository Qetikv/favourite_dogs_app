import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/models/my_app_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
      ),
      body: appState.favorites.isEmpty
          ? const Center(
              child: Text('No favorites yet.'),
            )
          : ListView.builder(
              itemCount: appState.favorites.length,
              itemBuilder: (context, index) {
                final imageUrl = appState.favorites[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(imageUrl),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Favorite ${index + 1}',
                            style: const TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            appState.removeFromFavorites(imageUrl);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
