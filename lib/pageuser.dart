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
        color: Colors.blueGrey[50],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // รูปโปรไฟล์
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://cats.com/wp-content/uploads/2020/10/portrait-of-thai-cat-768x512.jpg', // ใส่ URL รูปโปรไฟล์ของผู้ใช้
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
              elevation: 5,
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
    );
  }
}
