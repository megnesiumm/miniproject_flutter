import 'package:flutter/material.dart';
import 'package:miniproject_flutter/constants.dart';
import 'package:miniproject_flutter/models/transaction.dart';
import 'package:miniproject_flutter/provider/transaction_provider.dart';
import 'package:provider/provider.dart';

class Pagecart extends StatelessWidget {
  const Pagecart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<TransactionProvider>(context).transactions;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PageColour,
        title:
            const Text('ตะกร้าสินค้า', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child:
                  Text('ไม่มีสินค้าในตะกร้า', style: TextStyle(fontSize: 20)))
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
                          title: Text(item.title),
                          subtitle: Text(
                              'จำนวน: ${item.quantityy} ชิ้น - ราคา: ฿${item.price}'),
                          trailing: Text(
                              '฿${(item.price * item.quantityy).toStringAsFixed(2)}'),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'ยอดรวม: ฿${getTotal(cartItems).toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
      backgroundColor: Colors.white,
    );
  }

  double getTotal(List<Transaction> cartItems) {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantityy;
    }
    return total;
  }
}
