import 'package:flutter/material.dart';
import 'package:pahlawan/hero_list_page.dart';
import 'package:pahlawan/add_hero_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda', style: TextStyle(fontSize: 24)),
        backgroundColor: const Color(0xFF4A6572),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF80C7C1), Color(0xFFB0D7D4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'APLIKASI NAMA PAHLAWAN',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A6572),
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Aplikasi ini memungkinkan Anda untuk melihat dan menambahkan informasi mengenai pahlawan.',
                  style: TextStyle(fontSize: 18, color: Color(0xFF4A6572)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HeroListPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF607D8B),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.list, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Lihat Daftar Pahlawan',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddHeroPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A6572),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Tambah Pahlawan',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
