import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_calc/screens/aritmatika.dart';
import 'package:riverpod_calc/screens/keliling_bangun_datar.dart';
import 'package:riverpod_calc/screens/perpangkatan.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Aritmatika()));
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calculate,
                      size: 75,
                      color: Color(0xff293c64),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Kalkulator Aritmatika",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xff7fa1c3),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const KelilingBangunDatar()));
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      size: 75,
                      color: Color(0xff293c64),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Keliling Bangun Datar",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xff7fa1c3),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("images/kubus.png"),
                    height: 75,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Keliling Bangun Ruang",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xff7fa1c3),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Perpangkatan()));
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("images/bilanganpangkat.png"),
                      height: 75,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Bilangan Pangkat",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xff7fa1c3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
