import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class EditHeroPage extends StatefulWidget {
  final Map<String, dynamic> hero;

  const EditHeroPage({super.key, required this.hero});

  @override
  State<EditHeroPage> createState() => _EditHeroPageState();
}

class _EditHeroPageState extends State<EditHeroPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  DateTime? tanggalLahir;
  DateTime? tanggalMeninggal;

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    namaController.text = widget.hero['nama'];
    deskripsiController.text = widget.hero['deskripsi'];
    tanggalLahir = DateTime.tryParse(widget.hero['tanggal_lahir']);
    tanggalMeninggal = DateTime.tryParse(widget.hero['tanggal_meninggal']);
  }

  Future<void> editHero() async {
    if (namaController.text.isEmpty || deskripsiController.text.isEmpty || tanggalLahir == null || tanggalMeninggal == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap lengkapi semua data')),
      );
      return;
    }

    final response = await http.put(
      Uri.parse('https://67876b3ac4a42c9161069d51.mockapi.io/pahlawan/hero/${widget.hero['id']}'),
      body: {
        'nama': namaController.text,
        'tanggal_lahir': dateFormat.format(tanggalLahir!),
        'tanggal_meninggal': dateFormat.format(tanggalMeninggal!),
        'deskripsi': deskripsiController.text,
      },
    );

    if (response.statusCode == 200 && mounted) {
      Navigator.pop(context, true);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal mengedit pahlawan')),
      );
    }
  }

  Future<void> pilihTanggalLahir() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: tanggalLahir ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != tanggalLahir) {
      setState(() {
        tanggalLahir = pickedDate;
      });
    }
  }

  Future<void> pilihTanggalMeninggal() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: tanggalMeninggal ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != tanggalMeninggal) {
      setState(() {
        tanggalMeninggal = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pahlawan'),
        backgroundColor: const Color(0xFF607D8B),
      ),
      backgroundColor: const Color(0xFFF1F5F8),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pahlawan',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Color(0xFF607D8B)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF607D8B), width: 2),
                  ),
                ),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: pilihTanggalLahir,
                child: AbsorbPointer(
                  child: TextField(
                    controller: TextEditingController(text: tanggalLahir != null ? dateFormat.format(tanggalLahir!) : ''),
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Lahir',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Color(0xFF607D8B)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF607D8B), width: 2),
                      ),
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: pilihTanggalMeninggal,
                child: AbsorbPointer(
                  child: TextField(
                    controller: TextEditingController(text: tanggalMeninggal != null ? dateFormat.format(tanggalMeninggal!) : ''),
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Meninggal',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Color(0xFF607D8B)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF607D8B), width: 2),
                      ),
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: deskripsiController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Color(0xFF607D8B)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF607D8B), width: 2),
                  ),
                ),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: editHero,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF607D8B),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
