import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Moneybox extends StatelessWidget {
  
  final String title ;
  final double amount;
  final double sizeconheight;
  final Color Colorset;
  final double broderradius;


  const Moneybox(
    this.title,
    this.amount,
    this.sizeconheight,
    this.Colorset,
    this.broderradius, {super.key},
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colorset, // ใช้ตัวแปรสีที่รับมา
        borderRadius: BorderRadius.circular(broderradius), // ใช้ตัวแปรความโค้งที่รับมา
      ),
      height: sizeconheight, // ใช้ตัวแปรความสูงที่รับมา
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title, // ใช้ตัวแปรชื่อรายการที่รับมา
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${NumberFormat("#,###.###").format(amount)}', // แปลงตัวเลขเป็นข้อความเพื่อแสดงผล
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}