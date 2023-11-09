import 'package:flutter/material.dart';

class CatgoryScreen extends StatelessWidget {
  const CatgoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick the category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: <Widget>[
          ...List.generate(
            6,
            (index) => Text(
              index.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
