import 'package:flutter/material.dart';
import 'package:miniproject_flutter/constants.dart';
import 'package:miniproject_flutter/models/transaction.dart';
import 'package:miniproject_flutter/provider/transaction_provider.dart';
import 'package:provider/provider.dart';

class Toy2 extends StatefulWidget {
  const Toy2({super.key});

  @override
  _Toy2State createState() => _Toy2State();
}

class _Toy2State extends State<Toy2> {
  final titleController = TextEditingController(text: "หนูปลอมคั๊บ");
  final quantityController = TextEditingController(text: "0");
  final priceController = TextEditingController(text: "1000");

  late Transaction transaction;

  @override
  void initState() {
    super.initState();
    transaction = Transaction(
      title: titleController.text,
      quantityy: int.parse(quantityController.text),
      price: double.parse(priceController.text),
      date: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PageColour,
        title: const Text(
          'หนูปลอมคั๊บ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/toycat2.png',
                          width: double.infinity,
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'หนูปลอมคั๊บ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'ราคา 1,000 บาท',
                          style: TextStyle(color: PriceColour, fontSize: 16.0),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Colors.black),
                              onPressed: () {
                                setState(() {
                                  if (transaction.quantityy > 0) {
                                    transaction.quantityy--;
                                  }
                                });
                              },
                            ),
                            Text(
                              '${transaction.quantityy}',
                              style: const TextStyle(fontSize: 20),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.black),
                              onPressed: () {
                                setState(() {
                                  transaction.quantityy++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'หนูปลอมคั๊บคือของเล่นที่แมวสามารถวิ่งไล่จับได้เพื่อฝึกทักษะการล่า หนูปลอมมักจะทำจากวัสดุที่มีความทนทานและมีการออกแบบที่ดึงดูดความสนใจของแมว .',
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () {
                var provider =
                    Provider.of<TransactionProvider>(context, listen: false);

                // เพิ่มสินค้าในตะกร้า
                provider.addTransaction(transaction);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("เพิ่มสินค้าในตะกร้าเรียบร้อย")),
                );
                Navigator.pop(context);
              },
              child: const Icon(Icons.shopping_cart,
                  color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
