import 'package:flutter/material.dart';
import 'input.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Go to Shopping'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ShoppingFormScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
