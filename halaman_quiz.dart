import 'dart:math';
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'model/quiz_model.dart';

class HalamanQuiz extends StatefulWidget {
  const HalamanQuiz({super.key});

  @override
  HalamanQuizState createState() => HalamanQuizState();
}

class HalamanQuizState extends State<HalamanQuiz> {
  late Quiz quiz;

  @override
  void initState() {
    super.initState();
    quiz = Quiz(Pertanyaan.kumpulanPertanyaan);
  }

  void _pertanyaanBerikutnya(int opsiTerpilih) {
    setState(() {
      quiz.pertanyaanBerikutnya(opsiTerpilih);
    });
  }

  void _ulangQuiz() {
    setState(() {
      quiz = Quiz(Pertanyaan.kumpulanPertanyaan);
    });
  }

  void _kembaliKeMenuUtama() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QUIZ MI")),
      body: Container(
        color: const Color.fromARGB(255, 93, 157, 186),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: quiz.adaPertanyaanBerikutnya
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '${quiz.indeksPertanyaanSaatIni + 1}',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            quiz.pertanyaanSaatIni.teksPertanyaan,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: List.generate(
                        quiz.pertanyaanSaatIni.opsi.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blueAccent, width: 1.5),
                            ),
                            child: TextButton(
                              onPressed: () => _pertanyaanBerikutnya(index),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                quiz.pertanyaanSaatIni.opsi[index],
                                style: const TextStyle(fontSize: 16, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
