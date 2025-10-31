import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List<String> posters;

  const MovieList({super.key, required this.title, required this.posters});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Judul Section (Trending, Popular, dll)
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text('More', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),

        // List Film Horizontal
        SizedBox(
          height: 250, // Ditingkatkan tingginya untuk memberi ruang pada judul
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              // --- Bagian yang Diubah (Menggunakan Column) ---
              return SizedBox(
                width: 110, // Lebar poster ideal
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Gambar Poster (Menggunakan Expanded untuk mengisi ruang)
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          // GUNAKAN LIST POSTERS DAN INDEX
                          posters[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    Text(
                      '$title Film $index + 1', // Judul menggunakan nama kategori
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors
                            .white, // Pastikan teks berwarna putih karena latar belakang hitam
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // 2. Judul Film
                  ],
                ),
              );
              // --- Akhir Perubahan ---
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: posters.length,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
