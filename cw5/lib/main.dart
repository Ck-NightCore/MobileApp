import 'package:flutter/material.dart';
import 'Moneybox.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Container Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Balance New',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: SafeArea(
        child: SingleChildScrollView( 
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // ส่วนบนสุด: ใช้ Container หุ้ม Inputnew ตามรูปภาพใหม่
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  height: 120,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Inputnew(), // เรียกใช้งาน Class ที่สร้างใหม่
                ),
                const SizedBox(height: 15),

                // รายการยอดเงินต่างๆ
                Moneybox('ยอดคงเหลือ', 30000.512, 150, Colors.blue, 30),
                const SizedBox(height: 8),
                
                Moneybox('รายรับ', 10000, 100, Colors.green, 30),
                const SizedBox(height: 8),
                
                Moneybox('รายจ่าย', 80000, 100, Colors.orange, 30),
                const SizedBox(height: 8),
                
                Moneybox('ค้างจ่าย', 4000, 100, Colors.yellow.shade600, 30),
                const SizedBox(height: 15),

                // ปุ่ม Submit
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      print("Submit Pressed");
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// สร้างคลาส Inputnew เพิ่มเติมตามที่โจทย์กำหนด
class Inputnew extends StatelessWidget {
  const Inputnew({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Account Name',
        labelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
          final Color color = states.contains(WidgetState.error)
              ? Theme.of(context).colorScheme.error
              : Colors.orange;
          return TextStyle(color: color, letterSpacing: 1.3);
        }),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter name';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.always,
    );
  }
}