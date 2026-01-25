import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController score1Ctrl = TextEditingController();
  final TextEditingController score2Ctrl = TextEditingController();
  final TextEditingController score3Ctrl = TextEditingController();

  String major = 'INE';
  String? subject;
  double totalScore = 0;
  String grade = '';

  final List<String> subjects = [
    'CS101',
    'CS102',
    'IT201',
    'NET202',
  ];

  void calculateGrade() {
    double s1 = double.tryParse(score1Ctrl.text) ?? 0;
    double s2 = double.tryParse(score2Ctrl.text) ?? 0;
    double s3 = double.tryParse(score3Ctrl.text) ?? 0;

    totalScore = s1 + s2 + s3;

    if (totalScore >= 80) {
      grade = 'A';
    } else if (totalScore >= 70) {
      grade = 'B';
    } else if (totalScore >= 60) {
      grade = 'C';
    } else if (totalScore >= 50) {
      grade = 'D';
    } else {
      grade = 'F';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('คำนวณเกรดนักศึกษา'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ===== ชื่อ - นามสกุล =====
            TextField(
              controller: firstNameCtrl,
              decoration: const InputDecoration(
                labelText: 'ชื่อ',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lastNameCtrl,
              decoration: const InputDecoration(
                labelText: 'นามสกุล',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            /// ===== สาขาวิชา =====
            Row(
              children: const [
                Icon(Icons.school, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'สาขาวิชา',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'INE',
                  groupValue: major,
                  onChanged: (value) {
                    setState(() {
                      major = value!;
                    });
                  },
                ),
                const Text('INE'),
                Radio(
                  value: 'INET',
                  groupValue: major,
                  onChanged: (value) {
                    setState(() {
                      major = value!;
                    });
                  },
                ),
                const Text('INET'),
              ],
            ),

            const SizedBox(height: 10),

            /// ===== รหัสวิชา =====
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'รหัสวิชา',
                prefixIcon: Icon(Icons.book),
                border: OutlineInputBorder(),
              ),
              items: subjects
                  .map(
                    (s) => DropdownMenuItem(
                      value: s,
                      child: Text(s),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                subject = value;
              },
            ),

            const SizedBox(height: 20),

            /// ===== คะแนน =====
            TextField(
              controller: score1Ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'คะแนนเก็บ',
                prefixIcon: Icon(Icons.assignment),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: score2Ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'คะแนนกลางภาค',
                prefixIcon: Icon(Icons.edit),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: score3Ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'คะแนนปลายภาค',
                prefixIcon: Icon(Icons.fact_check),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            /// ===== ปุ่มคำนวณ =====
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: calculateGrade,
                icon: const Icon(Icons.calculate),
                label: const Text('คำนวณเกรด'),
              ),
            ),

            const SizedBox(height: 20),

            /// ===== แสดงผลลัพธ์ =====
            if (grade.isNotEmpty)
              Card(
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.analytics, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'ผลการคำนวณ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text('ชื่อ: ${firstNameCtrl.text} ${lastNameCtrl.text}'),
                      Text('คะแนนเก็บ: ${score1Ctrl.text}'),
                      Text('คะแนนกลางภาค: ${score2Ctrl.text}'),
                      Text('คะแนนปลายภาค: ${score3Ctrl.text}'),
                      Text('คะแนนรวม: $totalScore'),
                      Text(
                        'เกรด: $grade',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
