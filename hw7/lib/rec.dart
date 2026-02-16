import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key});

  @override
  State<RectanglePage> createState() => _RectanglePageState();
}

class _RectanglePageState extends State<RectanglePage> {
  int index = 0;
  final w = TextEditingController();
  final h = TextEditingController();
  String result = '';

  void calculate() {
    double width = double.parse(w.text);
    double height = double.parse(h.text);

    setState(() {
      result = index == 0
          ? 'Area = ${width * height}'
          : 'Volume = ${width * height * height}';
    });
  }

  Widget inputCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: w, decoration: const InputDecoration(labelText: 'Width')),
            const SizedBox(height: 12),
            TextField(controller: h, decoration: const InputDecoration(labelText: 'Height')),
          ],
        ),
      ),
    );
  }

  Widget resultBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        result,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('สี่เหลี่ยม')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.square), label: 'Area'),
          BottomNavigationBarItem(icon: Icon(Icons.view_in_ar), label: 'Volume'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            inputCard(),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calculate,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('คำนวณ', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 16),
            if (result.isNotEmpty) resultBox(),
          ],
        ),
      ),
    );
  }
}
