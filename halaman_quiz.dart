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
 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const RadialGradient(
                          colors: [Colors.white, Colors.blue],
                          center: Alignment.center,
                          radius: 0.85,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(80, 33, 150, 243),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("your Score", style: TextStyle(fontSize: 16, color: Colors.blue)),
                            Text("${quiz.skor} pt", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
                      ),
                      child: GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 2.5,
                        ),
                        children: [
                          _infoSkorItem(Icons.check_circle, Colors.blue, "100%", "Completion"),
                          _infoSkorItem(Icons.list_alt, Colors.blue, "${quiz.pertanyaan.length}", "Total Question"),
                          _infoSkorItem(Icons.check, Colors.green, "${quiz.skor ~/ 10}", "Correct"),
                          _infoSkorItem(Icons.close, Colors.red, "${max(0, quiz.pertanyaan.length - (quiz.skor ~/ 10))}", "Wrong"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: _kembaliKeMenuUtama,
                            icon: const Icon(Icons.home),
                            label: const Text("Home"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 45),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: _ulangQuiz,
                            icon: const Icon(Icons.refresh),
                            label: const Text("Play Again"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 45),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget _infoSkorItem(IconData icon, Color color, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: color),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(label, style: const TextStyle(fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
