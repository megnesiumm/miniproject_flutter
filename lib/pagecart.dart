import 'package:flutter/material.dart';
import 'package:miniproject_flutter/product.dart'; // นำเข้า Product class

class Pagecart extends StatelessWidget {
  final List<Product> cartItems;

  const Pagecart({super.key, required this.cartItems});

  double getTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'ตะกร้าสินค้า',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'ไม่มีสินค้าในตะกร้า',
                style: TextStyle(fontSize: 20),
              ),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'ยอดรวม: ฿${getTotal().toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
      backgroundColor: Colors.white,
    );
  }
}
