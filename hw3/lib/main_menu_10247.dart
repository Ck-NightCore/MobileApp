import 'package:flutter/material.dart';
import 'food_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Food Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int totalCount = 0;
  int totalPrice = 0;

  List<Foodmenu> menu = [
    Foodmenu("กุ้งเผา", "520", 'assets/images/m6.jpg', 'อาหารทะเล'),
    Foodmenu("ปลาทอด", "310", 'assets/images/m8.jpg', 'อาหารทะเล'),
    Foodmenu("กุ้งคั่วพริกเกลือ", "145", 'assets/images/m19.jpg', 'อาหารทะเล'),
    Foodmenu("แกงจืดมะระ", "65", 'assets/images/m7.jpg', 'อาหารต้ม'),
    Foodmenu("ต้มแซ่บ", "75", 'assets/images/m16.jpg', 'อาหารต้ม'),
    Foodmenu("ต้มจืดเต้าหู้", "70", 'assets/images/m17.jpg', 'อาหารต้ม'),
    Foodmenu("ราเมง", "180", 'assets/images/m15.jpg', 'อาหารญี่ปุ่น'),
    Foodmenu("ซูชิ", "95", 'assets/images/m3.jpg', 'อาหารญี่ปุ่น'),
    Foodmenu("ผัดไทกุ้งสด", "85", 'assets/images/m2.jpg', 'ผัดไทย&หอยทอด'),
    Foodmenu("หอยทอด", "90", 'assets/images/m20.jpg', 'ผัดไทย&หอยทอด'),
    Foodmenu("นักเก็ต", "110", 'assets/images/m12.jpg', 'อาหารทานเล่น'),
    Foodmenu("ไก่ป็อป", "75", 'assets/images/m11.jpg', 'อาหารทานเล่น'),
    Foodmenu("ชีสสติ๊ก", "125", 'assets/images/m13.jpg', 'อาหารทานเล่น'),
    Foodmenu("ค็อกเก้", "85", 'assets/images/m14.jpg', 'อาหารทานเล่น'),
    Foodmenu("เบอร์เกอร์", "150", 'assets/images/m10.jpg', 'อาหารทานเล่น'),
    Foodmenu("ขนมจีบ", "60", 'assets/images/m18.jpg', 'อาหารทานเล่น'),
    Foodmenu("ซาลาเปา", "65", 'assets/images/m5.jpg', 'อาหารทานเล่น'),
    Foodmenu("บัวลอย", "55", 'assets/images/m21.jpg', 'ของหวาน'),
    Foodmenu("ทับทิมกรอบ", "70", 'assets/images/m22.jpg', 'ของหวาน'),
    Foodmenu("ขนมใส่ไส้", "50", 'assets/images/m23.jpg', 'ของหวาน'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Menu"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) {
          Foodmenu food = menu[index];
          return ListTile(
            leading: Image.asset(food.images, width: 60, fit: BoxFit.cover),
            title: Text(
              "เมนูที่ ${index + 1}. ${food.foodName}",
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            subtitle: Text("ประเภท: ${food.type} | ราคา ${food.foodPrice} บาท"),
            onTap: () {
              setState(() {
                totalCount += 1;
                totalPrice += int.parse(food.foodPrice);
              });
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("คุณเลือก ${food.foodName}"),
                    content: Text(
                      "คุณเลือกทั้งหมด: $totalCount รายการ\nราคารวม: $totalPrice บาท",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("ตกลง"),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
