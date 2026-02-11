import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMIPage(),
    );
  }
}

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String result = "";
  String category = "";
  String advice = "";
  double bmi = 0;

  // ================= DATABASE =================
  Future<Database> initDB() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'bmi.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE bmi_normal(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            weight REAL
          )
        ''');
      },
    );
  }

  Future<void> insertNormalWeight(double weight) async {
    final db = await initDB();
    await db.insert("bmi_normal", {"weight": weight});
  }

  // ================= BMI CATEGORY =================
  String getCategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 23) return "Normal";
    if (bmi < 25) return "Overweight";
    if (bmi < 30) return "Obese";
    return "Severely Obese";
  }

  // ================= BMI IMAGE =================
  String getImage(double bmi) {
    if (bmi < 18.5) {
      return "assets/images/bmi-1.png";
    } 
    else if (bmi < 23) {
      return "assets/images/bmi-2.png";
    } 
    else if (bmi < 25) {
      return "assets/images/bmi-3.png";
    } 
    else if (bmi < 30) {
      return "assets/images/bmi-4.png";
    } 
    else {
      return "assets/images/bmi-5.png";
    }
  }

  // ================= CALCULATE =================
  void calculateBMI() async {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);

    bmi = weight / (height * height/10000);
    category = getCategory(bmi);

    double minNormal = 18.5 * height * height;
    double maxNormal = 22.9 * height * height;

    if (bmi < 18.5) {
      double diff = minNormal - weight;
      advice = "ควรเพิ่มน้ำหนัก ${diff.toStringAsFixed(2)} kg เพื่อเข้าสู่ระดับ Normal";
    } 
    else if (bmi > 22.9) {
      double diff = weight - maxNormal;
      advice = "ควรลดน้ำหนัก ${diff.toStringAsFixed(2)} kg เพื่อเข้าสู่ระดับ Normal";
    } 
    else {
      advice = "น้ำหนักอยู่ในเกณฑ์ปกติ (Normal)";
      await insertNormalWeight(weight);
    }

    setState(() {
      result = "BMI = ${bmi.toStringAsFixed(2)} ($category)";
    });
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "น้ำหนัก (kg)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "ส่วนสูง (เมตร)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateBMI,
                child: const Text("คำนวณ BMI"),
              ),
              const SizedBox(height: 20),
              Text(
                result,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              if (result.isNotEmpty)
                Image.asset(
                  getImage(bmi),
                  height: 150,
                ),
              const SizedBox(height: 10),
              Text(
                advice,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
