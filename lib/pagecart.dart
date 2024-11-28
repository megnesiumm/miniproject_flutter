import 'package:flutter/material.dart';
import 'package:miniproject_flutter/constants.dart';

// สร้างคลาส Product สำหรับเก็บข้อมูลสินค้า
class Product {
  final String name;
  int quantity;
  final double price;

  Product({
    required this.name,
    required this.quantity,
    required this.price,
  });
}

class Pagecart extends StatefulWidget {
  final List<Product> cartItems; // รับรายการสินค้าจากหน้า Toy1

  const Pagecart({super.key, required this.cartItems, required int quantity});

  @override
  // ignore: library_private_types_in_public_api
  _PagecartState createState() => _PagecartState();
}

class _PagecartState extends State<Pagecart> {
  // ฟังก์ชันคำนวณยอดรวมทั้งหมด
  double getTotal() {
    double total = 0;
    for (var item in widget.cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PageColour,
        title: const Text(
          'ตะกร้าสินค้า',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          // แสดงรายการสินค้าที่อยู่ในตะกร้า
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                        'จำนวน: ${item.quantity} ชิ้น - ราคา: ฿${item.price}'),
                    trailing: Text('฿${item.price * item.quantity}'),
                  ),
                );
              },
            ),
          ),
          // แสดงยอดรวมของตะกร้า
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'ยอดรวม: ฿${getTotal().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
