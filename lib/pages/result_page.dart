// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import '../utils/theme.dart';

class ResultPage extends StatelessWidget {
  final String nama, gender, kategori;
  final double bmi;

  const ResultPage({
    required this.nama,
    required this.bmi,
    required this.gender,
    required this.kategori,
    super.key,
  });

  String _getKategori() {
    if (bmi < 18.5) return 'Kurus';
    if (bmi < 25.0) return 'Normal';
    if (bmi < 30.0) return 'Gemuk';
    return "Obesitas";
  }

  Color _getKategoriColor() {
    if (bmi < 18.5) {return Colors.orange;} 

    if (bmi < 25.0) {return Colors.green;}

    if (bmi < 30.0) {return Colors.deepOrange;}

    return Colors.red;
  }

  IconData _getKategoriIcon() {
    if (bmi < 18.5) {return Icons.sentiment_dissatisfied;}

    if (bmi < 25.0) {return Icons.sentiment_satisfied_alt;}

    if (bmi < 30.0) {return Icons.sentiment_neutral;
}

    return Icons.warning_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [

              const SizedBox(height: 40),

              // Header
              Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),

                decoration: BoxDecoration(

                  gradient: const LinearGradient(
                    colors: [
                      lightBlue,
                      tosca,
                      darkBlue,
                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(30),

                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    const SizedBox(height: 15),

                    Text(
                      "Halo, $nama 👋",

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Berikut adalah hasil BMI kamu",

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Card BMI
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(60),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(30),

                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    Icon(
                      _getKategoriIcon(),
                      size: 80,
                      color: _getKategoriColor(),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      bmi.toStringAsFixed(1),

                      style: const TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      _getKategori(),

                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: _getKategoriColor(),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // Button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },

                child: Container(
                  width: 350,
                  height: 70,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),

                    gradient: const LinearGradient(
                      colors: [
                        darkBlue,
                        tosca,
                      ],

                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),

                  child: const Center(
                    child: Text(
                      "Hitung Ulang",

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}