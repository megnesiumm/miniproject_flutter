import 'package:flutter/material.dart';
import 'package:miniproject_flutter/constants.dart';
import 'package:miniproject_flutter/homepage.dart';
import 'package:miniproject_flutter/pagecart.dart';
import 'package:miniproject_flutter/pagemenu.dart';
import 'package:miniproject_flutter/pageuser.dart';
import 'package:miniproject_flutter/product.dart'; // นำเข้า Product class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // หน้าหลักคือ HomeScreen
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Product> _cartItems = [];

  // หน้าจอที่สามารถเลือกได้
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const Homepage(),
      const Pagemenu(),
      Pagecart(cartItems: _cartItems), // ส่ง cartItems ที่อัปเดตไปยัง Pagecart
      const Pageuser(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 5.0),
        height: 70.0,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              child: Icon(
                Icons.home,
                color: _currentIndex == 0 ? IconColour : Colors.grey,
                size: 40.0,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              child: Icon(
                Icons.menu,
                color: _currentIndex == 1 ? IconColour : Colors.grey,
                size: 40.0,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              child: Icon(
                Icons.shopping_cart,
                color: _currentIndex == 2 ? IconColour : Colors.grey,
                size: 40.0,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              child: Icon(
                Icons.account_circle,
                color: _currentIndex == 3 ? IconColour : Colors.grey,
                size: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // // ฟังก์ชันที่ใช้เพิ่มสินค้าในตะกร้า
  // void addToCart(Product product) {
  //   setState(() {
  //     _cartItems.add(product); // เพิ่มสินค้าใหม่ในตะกร้า
  //   });
  // }

  // // ฟังก์ชันที่ใช้ลบสินค้าออกจากตะกร้า
  // void removeFromCart(Product product) {
  //   setState(() {
  //     _cartItems.remove(product); // ลบสินค้าออกจากตะกร้า
  //   });
  // }
}
