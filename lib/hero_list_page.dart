import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'add_hero_page.dart';
import 'hero_detail_page.dart';

class HeroListPage extends StatefulWidget {
  const HeroListPage({super.key});

  @override
  State<HeroListPage> createState() => _HeroListPageState();
}

class _HeroListPageState extends State<HeroListPage> {
  List heroes = [];

  @override
  void initState() {
    super.initState();
    fetchHeroes();
  }

  Future<void> fetchHeroes() async {
    final response = await http.get(
      Uri.parse('https://67876b3ac4a42c9161069d51.mockapi.io/pahlawan/hero'),
    );
    if (response.statusCode == 200) {
      setState(() {
        heroes = json.decode(response.body);
      });
    }
  }

  Future<void> deleteHero(String id) async {
    final response = await http.delete(
      Uri.parse('https://67876b3ac4a42c9161069d51.mockapi.io/pahlawan/hero/$id'),
    );
    if (response.statusCode == 200) {
      fetchHeroes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pahlawan', style: TextStyle(fontSize: 22)),
        backgroundColor: const Color(0xFF607D8B),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddHeroPage()),
              ).then((value) => fetchHeroes());
            },
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF80C7C1), Color(0xFFB0D7D4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: heroes.length,
          itemBuilder: (context, index) {
            final hero = heroes[index];
            return Card(
              color: const Color(0xFFE0F2F1),
              margin: const EdgeInsets.all(10),
              elevation: 5,
              shadowColor: Colors.black.withOpacity(0.1),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Text(
                    hero['nama'][0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  hero['nama'],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Lahir: ${hero['tanggal_lahir']}\nDeskripsi: ${hero['deskripsi']}',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HeroDetailPage(hero: hero),
                    ),
                  );
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Konfirmasi'),
                            content: const Text(
                                'Apakah Anda yakin ingin menghapus pahlawan ini?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  deleteHero(hero['id']);
                                  Navigator.pop(context);
                                },
                                child: const Text('Hapus'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
