import 'package:flutter/material.dart';
import 'package:miniproject_flutter/constants.dart';
import 'package:miniproject_flutter/homepage.dart';
import 'package:miniproject_flutter/pagecart.dart';
import 'package:miniproject_flutter/pagemenu.dart';
import 'package:miniproject_flutter/pageuser.dart';

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
  final int _quantity = 0; // ตัวแปรจำนวนสินค้าในตะกร้า

  // ย้ายการสร้าง _screens ไปใน build() เพื่อให้สามารถเข้าถึง _quantity ได้
  @override
  Widget build(BuildContext context) {
    // หน้าจอที่สามารถเลือกได้
    // ignore: no_leading_underscores_for_local_identifiers
    final List<Widget> _screens = [
      const Homepage(),
      const Pagemenu(),
      Pagecart(quantity: _quantity, cartItems: const [],), // ส่งค่า _quantity ไปที่ Pagecart
      const Pageuser(),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
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
}
