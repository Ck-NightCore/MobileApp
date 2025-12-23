import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodMenuPage(),
    );
  }
}

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  List<String> menuList = [];
  int menuCount = 1;

  void addMenu() {
    setState(() {
      menuList.add("เมนูที่ $menuCount");
      menuCount++;
    });
  }

  void removeMenu() {
    if (menuList.isNotEmpty) {
      setState(() {
        menuList.removeLast();
        menuCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Food Menu")),
      body: ListView.builder(
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.dining_sharp),
            title: Text(menuList[index], style: const TextStyle(fontSize: 20)),
          );
        },
      ),

      // FloatingActionButton 2 ปุ่ม
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: addMenu,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: removeMenu,
            backgroundColor: Colors.pinkAccent,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
