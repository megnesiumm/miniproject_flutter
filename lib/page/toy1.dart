import 'package:flutter/material.dart';
import 'package:miniproject_flutter/constants.dart';
import 'package:miniproject_flutter/pagecart.dart';

class Toy1 extends StatefulWidget {
  const Toy1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Toy1State createState() => _Toy1State();
}

class _Toy1State extends State<Toy1> {
  int _quantity = 0; // จำนวนสินค้าเริ่มต้นเป็น 0

  // สร้าง Product สำหรับตะกร้า
  List<Product> cartItems = [
    Product(name: 'ที่ตกแมวววว', quantity: 0, price: 1991.0), // สินค้าตัวอย่าง
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'ที่ตกแมวววว',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // เนื้อหาหลักของหน้าจอ
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
                        'images/toycat1.png',
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'ที่ตกแมวววว',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'ราคา 1,991 บาท',
                        style: TextStyle(color: PriceColour, fontSize: 16.0),
                      ),
                      const SizedBox(height: 10),
                      // การปรับเพิ่มลดจำนวนสินค้า
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
                  'ไม้ตกแมวเป็นของเล่นแมวที่ควรมีติดบ้านชิ้นหนึ่ง เพราะมีราคาถูก หาซื้อง่าย...',
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          // ปุ่ม shopping_cart อยู่กลางด้านล่าง
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
                // ส่งจำนวนสินค้าและรายการสินค้าผ่าน Navigator ไปยัง Pagecart
                cartItems[0].quantity = _quantity; // อัปเดตจำนวนสินค้า
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pagecart(
                      cartItems: cartItems,
                      quantity: 0,
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
