import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pusjar'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari buku pelajaran',
                  hintStyle: const TextStyle(color: Colors.black38),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return bookReader(context, book['title']!, book['imagePath']!, book['detail']!, book['synopsis']!);
            },
          ),
        ),
      ),
    );
  }

  Widget bookReader(BuildContext context, String title, String imagePath, String detail, String synopsis) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(imagePath, width: double.infinity, height: 220, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  detail,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            title: title,
                            imagePath: imagePath,
                            synopsis: synopsis,
                            recommendedBooks: books,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Read Now', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> books = [
  {
    'title': 'Matematika Kelas 10',
    'imagePath': 'matematika.jpg',
    'detail': 'Panduan lengkap untuk pelajaran matematika.',
    'synopsis': 'Buku ini mencakup konsep dasar hingga lanjutan matematika untuk siswa kelas 10.',
  },
  {
    'title': 'Fisika Kelas 10',
    'imagePath': 'fisika.jpg',
    'detail': 'Eksperimen dan teori dasar fisika.',
    'synopsis': 'Menjelaskan prinsip dasar fisika dengan pendekatan eksperimen dan aplikasi nyata.',
  },
  {
    'title': 'Kimia Kelas 10',
    'imagePath': 'kimia.jpg',
    'detail': 'Mengenal reaksi kimia dan tabel periodik.',
    'synopsis': 'Buku ini membahas dasar-dasar kimia yang meliputi atom, molekul, dan reaksi kimia.',
  },
  {
    'title': 'Biologi Kelas 10',
    'imagePath': 'biologi.jpg',
    'detail': 'Pelajari dunia kehidupan.',
    'synopsis': 'Buku ini memberikan pemahaman tentang sel, organisme, dan ekosistem.',
  },
  {
    'title': 'Sejarah Indonesia',
    'imagePath': 'sejarah.jpg',
    'detail': 'Jejak perjalanan bangsa.',
    'synopsis': 'Buku ini menyajikan perjalanan sejarah Indonesia dari masa prasejarah hingga modern.',
  },
  {
    'title': 'Bahasa Inggris Kelas 10',
    'imagePath': 'bahasa_inggris.jpg',
    'detail': 'Kuasai bahasa internasional.',
    'synopsis': 'Panduan lengkap untuk memahami grammar, vocabulary, dan speaking dalam bahasa Inggris.',
  },
  {
    'title': 'Ekonomi Kelas 10',
    'imagePath': 'ekonomi.jpg',
    'detail': 'Dasar-dasar ekonomi.',
    'synopsis': 'Buku ini menjelaskan konsep ekonomi mikro dan makro untuk pemula.',
  },
  {
    'title': 'Geografi Kelas 10',
    'imagePath': 'geografi.jpg',
    'detail': 'Mengenal bumi dan fenomenanya.',
    'synopsis': 'Buku ini mengulas tentang peta, sumber daya alam, dan fenomena geografis.',
  },
  {
    'title': 'Sosiologi Kelas 10',
    'imagePath': 'sosiologi.jpg',
    'detail': 'Interaksi sosial dan masyarakat.',
    'synopsis': 'Membahas dasar-dasar sosiologi dan fenomena sosial di masyarakat.',
  },
  {
    'title': 'PKn Kelas 10',
    'imagePath': 'pkn.jpg',
    'detail': 'Pendidikan Kewarganegaraan.',
    'synopsis': 'Buku ini membahas hak, kewajiban, dan nilai-nilai kebangsaan.',
  },
];

