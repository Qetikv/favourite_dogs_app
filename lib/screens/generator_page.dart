import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/models/my_app_state.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); 

    return Center(
      child: appState.loading
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  appState.imageUrl,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    appState.fetchRandomImage();
                  },
                  child: const Text('Next Image', style: TextStyle(color: Colors.deepOrange)),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        appState.addToFavorites(appState.imageUrl);
                      },
                      icon: Icon(
                        appState.liked ? Icons.favorite : Icons.favorite_border,
                        color: appState.liked ? Colors.red : null,
                      ),
                    ),
                    const Text(
                      'Save',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
