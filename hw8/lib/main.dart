import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'List Example'),
    );
  }
}

// ---------------- DATA CLASS ----------------
class Data {
  int id;
  String name;
  DateTime time;

  Data(this.id, this.name, this.time);
}

// ---------------- HOME PAGE ----------------
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String txt = '';
  List<Data> myList = [];
  int img = 1;

  void onRadioChanged(int? value) {
    setState(() {
      img = value!;
    });
  }

  // รองรับ 4.jpg ที่เหลือเป็น png (รวม 7.png)
  String getImagePath(int id) {
    if (id == 4) {
      return 'assets/images/4.jpg';
    }
    return 'assets/images/$id.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---------- RADIO IMAGES ----------
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  radioItem(1),
                  radioItem(2),
                  radioItem(3),
                  radioItem(4),
                  radioItem(7),
                ],
              ),
            ),

            // ✅ เส้นคั่น (แทน Enter text)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(thickness: 1),
            ),

            // ---------- ADD BUTTON ----------
            ElevatedButton(
              onPressed: () {
                setState(() {
                  txt = 'Add item Success';
                  myList.add(Data(img, 'item', DateTime.now()));
                });
              },
              child: const Text('Add Item'),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                txt,
                style: TextStyle(
                  fontSize: 16 * MediaQuery.textScaleFactorOf(context),
                  color: Colors.black54,
                ),
              ),
            ),

            // ---------- LIST ----------
            SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            getImagePath(myList[index].id),
                          ),
                        ),
                        title: Text(
                          'Title Text (${myList[index].id})',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          myList[index].time.toString(),
                          style: const TextStyle(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: const Icon(Icons.delete_rounded),
                        onTap: () {
                          setState(() {
                            txt = 'Title Text (${myList[index].id}) is remove';
                            myList.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget radioItem(int value) {
    return Row(
      children: [
        Radio<int>(value: value, groupValue: img, onChanged: onRadioChanged),
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(getImagePath(value)),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
