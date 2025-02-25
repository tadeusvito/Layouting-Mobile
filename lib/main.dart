import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cek Kodam',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.black87,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black45,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Roboto'),
          bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
          titleLarge: TextStyle(color: Colors.purpleAccent, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.purpleAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 32),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String _kodamResult = '';
  final List<String> kodamList = [
    'Macan Pemarah', 'Buaya Sunda', 'Beruang Sunda', 'Tutup Odol', 'Tutup Panci', 'Kaleng Kejepit',
    'Kanebo Kering', 'Kapal Karam', 'Gergaji Mesin', 'Nyi Blorong', 'Jin Rawa Rontek', 'Kucing Israel',
    'Capung Gila', 'Tumis Kangkung', 'Jam Dinding Rusak', 'Gunting Tumpul', 'Kasur Empuk', 'Payung Robek',
    'Kulkas Kosong', 'Piring Pecah', 'Meja Berdecit', 'Koper Berat', 'Topi Melorot', 'Lem Super Lengket',
    'Keripik Garing', 'Senter Mati', 'Kue Kering', 'Bantal Empuk',
  ];

  void _checkKodam() {
    if (_formKey.currentState!.validate()) {
      final random = Random();
      // Mengambil kodam secara acak dari daftar kodam
      String randomKodam = kodamList[random.nextInt(kodamList.length)];

      setState(() {
        _kodamResult = randomKodam;
      });

      // Menampilkan pop-up dialog yang lebih cantik sesuai tema
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black87, // Background lebih gelap untuk pop-up
            title: Text(
              'Hasil Cek Kodam',
              style: TextStyle(
                color: Colors.purpleAccent, // Warna judul sesuai tema
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'Nama Anda masuk ke: $randomKodam',
              style: TextStyle(
                color: Colors.white, // Warna teks isi pop-up sesuai tema gelap
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Menutup dialog setelah tombol "OK" ditekan
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.purpleAccent, // Tombol "OK" dengan warna yang sesuai tema
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  // Fungsi untuk mereset form dan hasil
  void _reset() {
    setState(() {
      _nameController.clear();
      _kodamResult = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Kodam'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Action button behavior
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.black87,
                    title: Text('Information', style: TextStyle(color: Colors.purpleAccent)),
                    content: Text('Masukkan Nama Anda untuk Menemukan Kodam yang Tersembunyi di Dalamnya!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK', style: TextStyle(color: Colors.purpleAccent)),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image Widget with glowing effect
            Center(
              child: GlowImageWidget(),
            ),
            SizedBox(height: 40),

            // Form Input Widget
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Masukkan Nama Anda',
                      labelStyle: TextStyle(color: Colors.purpleAccent),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purpleAccent),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harap masukkan nama';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),

                  // Row containing Cek Kodam and Reset Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Submit Button
                      ElevatedButton(
                        onPressed: _checkKodam,
                        child: Text('Cek Kodam'),
                      ),
                      SizedBox(width: 20), // Spacing between the buttons

                      // Reset Button
                      ElevatedButton(
                        onPressed: _reset,
                        child: Text('Reset'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, // Menambahkan warna abu-abu pada tombol reset
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // Display Kodam Result
            if (_kodamResult.isNotEmpty)
              Text(
                'Kodam untuk nama Anda adalah: $_kodamResult',
                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

class GlowImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        width: 300,
        height: 330,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img.jpg'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
