import 'package:flutter/material.dart';
import 'package:miniproject_flutter/constants.dart';

class Pageuser extends StatelessWidget {
  const Pageuser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PageColour,
        title: const Center(
          child: Text(
            'ข้อมูลผู้ใช้',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // ใช้เพื่อรองรับหน้าจอเล็ก
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center, // จัดตำแหน่งให้อยู่กึ่งกลาง
            children: <Widget>[
              // รูปโปรไฟล์
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://cats.com/wp-content/uploads/2020/10/portrait-of-thai-cat-768x512.jpg',
                ),
              ),
              const SizedBox(height: 20),
              // ชื่อผู้ใช้
              const Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              // ข้อมูลการติดต่อ
              const Text(
                'Email: dobbie.cat@email.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Phone: +095 456 7890',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              // รายการข้อมูลเพิ่มเติม
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.blueAccent),
                  title: const Text('Additional Info'),
                  onTap: () {
                    // เปิดหน้าข้อมูลเพิ่มเติม
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
