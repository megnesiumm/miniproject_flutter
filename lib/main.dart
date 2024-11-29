import 'package:flutter/material.dart';
import 'package:miniproject_flutter/constants.dart';
import 'package:miniproject_flutter/homepage.dart';
import 'package:miniproject_flutter/pagecart.dart';
import 'package:miniproject_flutter/pagemenu.dart';
import 'package:miniproject_flutter/pageuser.dart';
import 'package:miniproject_flutter/provider/transaction_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(), // หน้าหลักคือ HomeScreen
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: PageColour),
        useMaterial3: true,
      ),
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

  @override
  Widget build(BuildContext context) {
    // หน้าจอที่สามารถเลือกได้
    final List<Widget> screens = [
      const Homepage(),
      const Pagemenu(),
      const Pagecart(), // ไม่ต้องส่ง `cartItems` เนื่องจากใช้ `Provider`
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
}
