import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../widget/movie_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Data Gambar (Gunakan aset lokal yang sudah Anda upload, diulang seperlunya)
  final List<String> trendingPosters = const [
    'assets/images/ANNABBLE.jpg',
    'assets/images/AQUIETPLACE.jpg',
    'assets/images/MACABRE.jpg',
    'assets/images/MAFIASIBLINGS.png',
    'assets/images/MALEFICENT.jpg',
    'assets/images/MAMA.jpg',
    'assets/images/ORPHAN.jpg',
    'assets/images/TERRIFIER.jpg',
    'assets/images/THECOUNJURING.jpg',
    'assets/images/THEFORIST.jpg',

    // ... ulangi path gambar lain hingga minimal 15 item
  ];

  final List<String> popularPosters = const [
    'assets/images/ANNABBLE.jpg',
    'assets/images/AQUIETPLACE.jpg',
    'assets/images/MACABRE.jpg',
    'assets/images/MAFIASIBLINGS.png',
    'assets/images/MALEFICENT.jpg',
    'assets/images/MAMA.jpg',
    'assets/images/ORPHAN.jpg',
    'assets/images/TERRIFIER.jpg',
    'assets/images/THECOUNJURING.jpg',
    'assets/images/THEFORIST.jpg',
    // ... ulangi path gambar lain hingga minimal 15 item
  ];

  final List<String> topRatedPosters = const [
    'assets/images/ANNABBLE.jpg',
    'assets/images/AQUIETPLACE.jpg',
    'assets/images/MACABRE.jpg',
    'assets/images/MAFIASIBLINGS.png',
    'assets/images/MALEFICENT.jpg',
    'assets/images/MAMA.jpg',
    'assets/images/ORPHAN.jpg',
    'assets/images/TERRIFIER.jpg',
    'assets/images/THECOUNJURING.jpg',
    'assets/images/THEFORIST.jpg',
    // ... ulangi path gambar lain hingga minimal 15 item
  ];

  // Data gambar film yang sudah dipindahkan ke folder assets/images
  final List<Map<String, String>> movieData = const [
    {
      'title': 'ANNABBLE',
      'poster': 'assets/images/ANNABBLE.jpg', // <--- JALUR LOKAL BARU
    },
    {
      'title': 'A QUIET PLACE',
      'poster': 'assets/images/AQUIETPLACE.jpg', // <--- JALUR LOKAL BARU
    },
    {
      'title': 'MACABRE',
      'poster': 'assets/images/MACABRE.jpg', // <--- JALUR LOKAL BARU
    },
    {
      'title': 'MAFIA SIBLINGS',
      'poster': 'assets/images/MAFIASIBLINGS.png', // <--- JALUR LOKAL BARU
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Tidak perlu membuat list cards secara eksplisit jika menggunakan cardBuilder
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Rls', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black, // Tema gelap
        elevation: 0,
        actions: const [
          // Tambahkan ikon pencarian
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header "Now Playing"
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
              child: Text(
                'Now Playing',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(
              height: 400, // Tinggikan sedikit agar gambar lebih jelas
              child: CardSwiper(
                // Ambil jumlah card dari data film
                cardsCount: movieData.length,
                // Gunakan cardBuilder untuk membuat card dari data film
                cardBuilder:
                    (context, index, percentThresholdX, percentThresholdY) {
                      final movie = movieData[index];

                      return _buildMovieCard(movie['poster']!, movie['title']!);
                    },
              ),
            ),

            // Bagian Scroll Horizontal
            MovieList(title: 'Trending', posters: trendingPosters),
            MovieList(title: 'Popular', posters: popularPosters),
            MovieList(title: 'Top Rated', posters: topRatedPosters),
          ],
        ),
      ),
    );
  }

  // Widget Pembantu untuk Card Film (Swiper)
  Widget _buildMovieCard(String imageUrl, String title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0), // Berikan sudut melengkung
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Gambar Poster Film
          Image.asset(
            imageUrl,
            fit: BoxFit.cover, // Pastikan gambar mengisi seluruh area
            // Placeholder jika gagal
          ),

          // 2. Overlay Gradien Hitam di Bawah (untuk kejelasan teks)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1.0], // Gradasi mulai dari tengah ke bawah
              ),
            ),
          ),

          // 3. Judul Film dan Detail di Bawah
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur...',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
