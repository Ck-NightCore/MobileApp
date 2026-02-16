import 'package:flutter/material.dart';

class TrianglePage extends StatefulWidget {
  const TrianglePage({super.key});

  @override
  State<TrianglePage> createState() => _TrianglePageState();
}

class _TrianglePageState extends State<TrianglePage> {
  int index = 0;
  final base = TextEditingController();
  final height = TextEditingController();
  String result = '';

  void calculate() {
    double b = double.parse(base.text);
    double h = double.parse(height.text);

    setState(() {
      result = index == 0
          ? 'Area = ${0.5 * b * h}'
          : 'Volume = ${0.5 * b * h * h}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('สามเหลี่ยม')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.change_history), label: 'Area'),
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
                child: Column(
                  children: [
                    TextField(
                      controller: base,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Base'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: height,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Height'),
                    ),
                  ],
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
