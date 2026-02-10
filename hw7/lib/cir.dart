import 'package:flutter/material.dart';
import 'dart:math';

class CirclePage extends StatefulWidget {
  const CirclePage({super.key});

  @override
  State<CirclePage> createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  int index = 0;
  final radius = TextEditingController();
  String result = '';

  void calculate() {
    double r = double.parse(radius.text);

    setState(() {
      result = index == 0
          ? 'Area = ${pi * r * r}'
          : 'Volume = ${(4 / 3) * pi * pow(r, 3)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('วงกลม')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Area'),
          BottomNavigationBarItem(icon: Icon(Icons.view_in_ar), label: 'Volume'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: radius,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Radius'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calculate,
                child: const Text('คำนวณ'),
              ),
            ),
            const SizedBox(height: 16),
            if (result.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
