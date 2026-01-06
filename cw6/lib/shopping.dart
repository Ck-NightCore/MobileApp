import 'package:flutter/material.dart';

class Shopping extends StatelessWidget {
  final String productName;
  final String customerName;

  const Shopping({
    super.key,
    required this.productName,
    required this.customerName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.shopping_bag),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(customerName),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
