class Pertanyaan {
  final String teksPertanyaan;
  final List<String> opsi;
  final int indeksOpsiBenar;

  Pertanyaan(this.teksPertanyaan, this.opsi, this.indeksOpsiBenar);

  bool cekJawaban(int indeks) {
    return indeks == indeksOpsiBenar;
  }

  static List<Pertanyaan> get kumpulanPertanyaan => [
        Pertanyaan("Konsep manakah yang bukan merupakan bagian dari prinsip-prinsip OOP?", ["Encapsulation", "Inheritance", "Polymorphism", "Querying"], 3),
        Pertanyaan("Apa tujuan utama dari basis data dalam sistem informasi?", ["Mengelola perangkat keras", "Menyimpan, mengelola, dan memproses data", "Menampilkan data", "Memastikan keamanan aplikasi"], 1),
        Pertanyaan("Android Studio adalah perangkat lunak yang digunakan untuk mengembangkan aplikasi desktop, bukan aplikasi mobile", ["True", "False"], 1),
        Pertanyaan("Inheritance adalah prinsip dasar OOP yang memungkinkan objek untuk mewarisi sifat dan perilaku dari objek lain", ["True", "False"], 0),
        Pertanyaan("JavaScript digunakan untuk membangun aplikasi mobile, bukan aplikasi web", ["True", "False"], 1),
        Pertanyaan("Apa yang dimaksud dengan komputasi awan (cloud computing)?", ["Penyimpanan data secara lokal di komputer pribadi", "Penyimpanan dan pengolahan data yang dilakukan melalui internet", "Proses pengolahan data menggunakan perangkat keras khusus", "Pemrograman aplikasi berbasis web"], 1),
        Pertanyaan("Manakah di antara berikut ini yang merupakan perangkat lunak untuk pengembangan aplikasi mobile?", ["XAMPP", "Android Studio", "Oracle", "Apache"], 1),
        Pertanyaan("HTML adalah bahasa pemrograman yang digunakan untuk mengembangkan aplikasi web dinamis", ["True", "False"], 1),
        Pertanyaan("Manakah di antara berikut ini yang merupakan contoh sistem operasi?", ["MySQL", "Windows", "Apache", "Bootstrap"], 1),
        Pertanyaan("OOP (Object-Oriented Programming) merupakan paradigma pemrograman yang mengorganisir kode berdasarkan objek dan kelas", ["True", "False"], 0),
      ];
}

class Quiz {
  final List<Pertanyaan> pertanyaan;
  int indeksPertanyaanSaatIni = 0;
  int skor = 0;

  Quiz(this.pertanyaan);

  Pertanyaan get pertanyaanSaatIni => pertanyaan[indeksPertanyaanSaatIni];

  void pertanyaanBerikutnya(int opsiTerpilih) {
    if (pertanyaanSaatIni.cekJawaban(opsiTerpilih)) {
      skor += 10;
    }
    indeksPertanyaanSaatIni++;
  }

  bool get adaPertanyaanBerikutnya => indeksPertanyaanSaatIni < pertanyaan.length;
}

