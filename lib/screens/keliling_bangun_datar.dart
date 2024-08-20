import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import '../widgets/calculate_button.dart';
import '../widgets/custom_input.dart';


final panjangProvider = StateProvider<double>((ref) => 0);
final lebarProvider = StateProvider<double>((ref) => 0);
final sisiProvider = StateProvider<double>((ref) => 0);
final jariJariProvider = StateProvider<double>((ref) => 0);

final kelilingPersegiPanjangProvider = StateProvider<double>((ref) => 0);
final kelilingPersegiProvider = StateProvider<double>((ref) => 0);
final kelilingLingkaranProvider = StateProvider<double>((ref) => 0);

class KelilingBangunDatar extends ConsumerWidget {
  const KelilingBangunDatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final panjangController = TextEditingController();
    final lebarController = TextEditingController();
    final sisiController = TextEditingController();
    final jariJariController = TextEditingController();

    final kelilingPersegiPanjang = ref.watch(kelilingPersegiPanjangProvider);
    final kelilingPersegi = ref.watch(kelilingPersegiProvider);
    final kelilingLingkaran = ref.watch(kelilingLingkaranProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Keliling Bangun Datar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Persegi Panjang',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            CustomInput(
              labelText: "Panjang",
              borderColor: Colors.black,
              focusedBorderColor: Colors.grey,
              inputType: TextInputType.number,
              controller: panjangController,
              labelColor: Colors.black,
            ),
            SizedBox(height: 20),
            CustomInput(
              labelText: "Lebar",
              borderColor: Colors.black,
              focusedBorderColor: Colors.grey,
              inputType: TextInputType.number,
              controller: lebarController,
              labelColor: Colors.black,
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculateButton(
                  icon: Icon(Icons.rectangle),
                  textButton: "Hitung Keliling Persegi Panjang",
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                  radius: 5,
                  elevation: 5,
                  onPressed: () {
                    if (panjangController.text.isEmpty ||
                        lebarController.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text('Inputan harus lengkap!'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      final panjang =
                          double.tryParse(panjangController.text) ?? 0;
                      final lebar = double.tryParse(lebarController.text) ?? 0;
                      ref.read(kelilingPersegiPanjangProvider.notifier).state =
                          2 * (panjang + lebar);
                    }
                  },
                ),
              ],
            ),
            Center(child: Text('Keliling: $kelilingPersegiPanjang')),
            SizedBox(height: 20),
            Text('Persegi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(height: 20),
            CustomInput(
                labelText: "Sisi",
                borderColor: Colors.black,
                focusedBorderColor: Colors.grey,
                inputType: TextInputType.number,
                controller: sisiController,
                labelColor: Colors.black),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculateButton(
                  icon: Icon(Icons.square),
                  textButton: "Hitung Keliling Persegi",
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                  radius: 5,
                  elevation: 5,
                  onPressed: () {
                    if (sisiController.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text('Inputan harus lengkap!'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      final sisi = double.tryParse(sisiController.text) ?? 0;
                      ref.read(kelilingPersegiProvider.notifier).state =
                          4 * sisi;
                    }
                  },
                ),
              ],
            ),
            Center(child: Text('Keliling: $kelilingPersegi')),
            SizedBox(height: 20),
            Text('Lingkaran',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(height: 20),
            CustomInput(
                labelText: "Jari-jari",
                borderColor: Colors.black,
                focusedBorderColor: Colors.grey,
                inputType: TextInputType.number,
                controller: jariJariController,
                labelColor: Colors.black),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculateButton(
                  icon: Icon(Icons.circle_rounded),
                  textButton: "Hitung Keliling Lingkaran",
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                  radius: 5,
                  elevation: 5,
                  onPressed: () {
                    if (jariJariController.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text('Inputan harus lengkap!'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      final jariJari =
                          double.tryParse(jariJariController.text) ?? 0;
                      ref.read(kelilingLingkaranProvider.notifier).state =
                          2 * pi * jariJari;
                    }
                  },
                ),
              ],
            ),
            Center(child: Text('Keliling: $kelilingLingkaran')),
          ],
        ),
      ),
    );
  }
}
