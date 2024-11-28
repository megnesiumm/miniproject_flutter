import 'package:flutter/material.dart';
import 'package:miniproject_flutter/constants.dart';
import 'package:miniproject_flutter/page/toy1.dart';
import 'package:miniproject_flutter/page/toy2.dart';
import 'package:miniproject_flutter/page/toy3.dart';
import 'package:miniproject_flutter/page/toy4.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // ประกาศลิสต์ของ toyImages, toyTexts, toyDetails ภายในฟังก์ชัน build
    final toyImages = [
      'images/toycat1.png',
      'images/toycat2.png',
      'images/toycat3.png',
      'images/toycat4.png'
    ];

    final toyTexts = [
      'ที่ตกแมวววว',
      'หนูปลอมคั๊บ',
      'ตุ๊กตามหาประลัย!',
      'อุโมงค์ล่อแมวว'
    ];

    final toyDetails = [
      'ไม้ตกแมวเป็นของเล่นแมวที่ควรมีติดบ้านชิ้นหนึ่ง...',
      'หนูปลอมคั๊บคือของเล่นที่แมวสามารถวิ่งไล่จับ...',
      'ตุ๊กตามหาประลัยเป็นของเล่นที่มีการออกแบบ...',
      'อุโมงค์ล่อแมวเป็นของเล่นที่ช่วยกระตุ้นให้แมวสนุก...'
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PageColour,
        title: const Center(
          child: Text(
            'หน้าหลัก',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // แสดง 2 รูปในแต่ละแถว
            crossAxisSpacing: 10.0, // ระยะห่างระหว่างคอลัมน์
            mainAxisSpacing: 20.0, // ระยะห่างระหว่างแถว
            childAspectRatio: 0.75, // ทำให้ขนาดรูปเหมาะสมกับข้อความ
          ),
          padding: const EdgeInsets.all(10.0), // ขอบรอบๆ
          itemCount: toyImages.length, // ใช้ความยาวของลิสต์ toyImages
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            switch (index) {
                              case 0:
                                return const Toy1();
                              case 1:
                                return const Toy2();
                              case 2:
                                return const Toy3();
                              case 3:
                                return const Toy4();
                              default:
                                return const Toy1();
                            }
                          },
                        ),
                      );
                    },
                    child: Image.asset(
                      toyImages[index],
                      width: 150.0,
                      height: 150.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    toyTexts[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("รายละเอียด"),
                              content: Text(toyDetails[index]),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("ปิด"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text("รายละเอียด"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
