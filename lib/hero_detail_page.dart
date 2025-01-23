import 'package:flutter/material.dart';

class HeroDetailPage extends StatelessWidget {
  final Map<String, dynamic> hero;

  const HeroDetailPage({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hero['nama']),
        backgroundColor: const Color(0xFF607D8B), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama: ${hero['nama']}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Tanggal Lahir: ${hero['tanggal_lahir'] ?? 'Tidak Diketahui'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Tanggal Meninggal: ${hero['tanggal_meninggal'] ?? 'Tidak Diketahui'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Deskripsi: ${hero['deskripsi']}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
