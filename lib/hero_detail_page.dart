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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.teal,
                  child: Text(
                    hero['nama'][0],
                    style: const TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  hero['nama'],
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, color: Color(0xFF607D8B)),
                          const SizedBox(width: 10),
                          Text(
                            'Tanggal Lahir: ${hero['tanggal_lahir'] ?? 'Tidak Diketahui'}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, color: Color(0xFF607D8B)),
                          const SizedBox(width: 10),
                          Text(
                            'Tanggal Meninggal: ${hero['tanggal_meninggal'] ?? 'Tidak Diketahui'}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Deskripsi:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF607D8B),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        hero['deskripsi'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
