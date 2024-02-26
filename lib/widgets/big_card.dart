import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final String imageUrl;

  const BigCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.network(imageUrl),
    );
  }
}
