import 'package:flutter/material.dart';
import 'rec.dart';
import 'tri.dart';
import 'cir.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget menuButton(
    BuildContext context,
    String text,
    IconData icon,
    Widget page,
  ) {
    return Card(
      // ✅ ใส่ shape ที่ Card (รองรับ Flutter เก่า)
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: ListTile(
        leading: Icon(
          icon,
          size: 32,
          color: Colors.blue,
        ),
        title: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geometry Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            menuButton(
              context,
              'สี่เหลี่ยม',
              Icons.crop_square,
              const RectanglePage(),
            ),
            const SizedBox(height: 12),
            menuButton(
              context,
              'สามเหลี่ยม',
              Icons.change_history,
              const TrianglePage(),
            ),
            const SizedBox(height: 12),
            menuButton(
              context,
              'วงกลม',
              Icons.circle,
              const CirclePage(),
            ),
          ],
        ),
      ),
    );
  }
}
