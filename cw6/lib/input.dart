import 'package:flutter/material.dart';
import 'shopping.dart';

class ShoppingFormScreen extends StatefulWidget {
  const ShoppingFormScreen({super.key});

  @override
  State<ShoppingFormScreen> createState() => _ShoppingFormScreenState();
}

class _ShoppingFormScreenState extends State<ShoppingFormScreen> {
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _customerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              controller: _productController,
              label: 'Product Name',
            ),
            _buildTextField(
              controller: _priceController,
              label: 'Product Price',
              keyboard: TextInputType.number,
            ),
            _buildTextField(
              controller: _qtyController,
              label: 'Number of Product',
              keyboard: TextInputType.number,
            ),
            _buildTextField(
              controller: _customerController,
              label: 'Customer Name',
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Go to Shopping'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Shopping(
                      productName: _productController.text,
                      customerName: _customerController.text,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.verified_outlined),
        ),
      ),
    );
  }
}
