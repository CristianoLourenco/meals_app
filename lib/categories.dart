import 'package:flutter/material.dart';

class CatgoriesScreen extends StatelessWidget {
  const CatgoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick the category'),
      ),
      body: GridView.builder()
    );
  }
}
