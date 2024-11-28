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
          itemCount: 4, // จำนวนรูปภาพทั้งหมด
          itemBuilder: (context, index) {
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

            // รายละเอียดที่แตกต่างกันสำหรับแต่ละปุ่ม
            final toyDetails = [
              'ไม้ตกแมวเป็นของเล่นแมวที่ควรมีติดบ้านชิ้นหนึ่ง เพราะมีราคาถูก หาซื้อง่าย เป็นของเล่นที่ไม่ว่าแมวตัวไหนก็ต้องพ่ายแพ้ วิธีเล่นก็เพียงแกว่งไม้ตกแมวไป-มา ',
              'หนูปลอมคั๊บคือของเล่นที่แมวสามารถวิ่งไล่จับได้เพื่อฝึกทักษะการล่า หนูปลอมมักจะทำจากวัสดุที่มีความทนทานและมีการออกแบบที่ดึงดูดความสนใจของแมว .',
              'ตุ๊กตามหาประลัยเป็นของเล่นที่มีการออกแบบให้เหมือนสัตว์ที่แมวสามารถใช้เป็นที่ฝึกการล่าและการหิ้ว ช่วยเสริมพัฒนาการทางการเคลื่อนไหวและการประสานงานของแมว.',
              'อุโมงค์ล่อแมวเป็นของเล่นที่ช่วยกระตุ้นให้แมวสนุกกับการวิ่งเข้าออกจากอุโมงค์ ช่วยให้แมวได้ออกกำลังกายและทำให้แมวรู้สึกตื่นเต้น.'
            ];

            return Container(
                padding:
                    const EdgeInsets.all(8.0), // ระยะห่างระหว่างกรอบและเนื้อหา
                decoration: BoxDecoration(
                  color: Colors.white, // สีพื้นหลังของกรอบ
                  borderRadius: BorderRadius.circular(10.0), // มุมมนของกรอบ
                  border: Border.all(
                    color: Colors.grey, // สีของกรอบ
                    width: 2.0, // ความหนาของกรอบ
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
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    // ทำให้ปุ่มยืดหยุ่นโดยใช้ Expanded
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
                ));
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
