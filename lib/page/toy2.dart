import 'package:flutter/material.dart';
import 'package:miniproject_flutter/constants.dart';
import 'package:miniproject_flutter/product.dart'; // นำเข้า Product class
import 'package:miniproject_flutter/pagecart.dart'; // นำเข้า Pagecart

class Toy2 extends StatefulWidget {
  const Toy2({super.key});

  @override
  _Toy1State createState() => _Toy1State();
}

class _Toy1State extends State<Toy2> {
  int _quantity = 0; // ตัวแปรเก็บจำนวนสินค้าที่เพิ่ม
  List<Product> cartItems = [
    Product(
        name: 'หนูปลอมคั๊บ', quantity: 0, price: 1000.0), // สินค้าที่จะเพิ่ม
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:PageColour,
        title: const Text(
          'หนูปลอมคั๊บ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // กลับไปหน้าเดิม
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
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
                                if (_quantity > 0) _quantity--;
                              });
                            },
                          ),
                          Text('$_quantity',
                              style: const TextStyle(fontSize: 20)),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.black),
                            onPressed: () {
                              setState(() {
                                _quantity++;
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
                setState(() {
                  // อัปเดตจำนวนสินค้าใน cartItems
                  cartItems[0].quantity = _quantity;
                  print(cartItems);
                });

                // ใช้ Navigator.pushReplacement เพื่อไปยังหน้า Pagecart
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pagecart(
                      cartItems: cartItems, // ส่ง cartItems ไปยัง Pagecart
                    ),
                  ),
                );
              },
              child: const Icon(Icons.shopping_cart,
                  color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
