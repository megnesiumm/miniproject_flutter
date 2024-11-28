import 'package:flutter/material.dart';
import 'package:miniproject_flutter/constants.dart';

class Pagemenu extends StatelessWidget {
  const Pagemenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PageColour,
        title: const Center(
            child: Text(
          'MENU',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // กำหนดจำนวนคอลัมน์ใน Grid
          crossAxisSpacing: 10, // ระยะห่างระหว่างคอลัมน์
          mainAxisSpacing: 10, // ระยะห่างระหว่างแถว
          children: <Widget>[
            _buildMenuItem(context, 'สินค้าสำหรับแมว', Icons.pets, Colors.blue),
            _buildMenuItem(
                context, 'อุปกรณ์เสริม', Icons.widgets, Colors.green),
            _buildMenuItem(context, 'ของเล่น', Icons.toys, Colors.red),
            _buildMenuItem(
                context, 'โปรโมชั่น', Icons.local_offer, Colors.orange),
            _buildMenuItem(
                context, 'ข้อมูลติดต่อ', Icons.contact_mail, Colors.purple),
            _buildMenuItem(context, 'คำถามที่พบบ่อย', Icons.help, Colors.teal),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  // ฟังก์ชันสำหรับสร้างเมนูไอเท็ม
  Widget _buildMenuItem(
      BuildContext context, String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // คุณสามารถนำทางไปยังหน้าอื่นๆ ที่เกี่ยวข้องได้
        // เช่น Navigator.push() หรือฟังก์ชันอื่นๆ
        // ตัวอย่างเช่น:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => NewPage()),
        // );
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('คุณเลือก: $title')));
      },
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 50, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
