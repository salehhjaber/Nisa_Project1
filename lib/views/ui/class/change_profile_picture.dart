
import 'package:flutter/material.dart';

class ChangeProfilePicturePage extends StatefulWidget {
  @override
  _ChangeProfilePicturePageState createState() =>
      _ChangeProfilePicturePageState();
}

class _ChangeProfilePicturePageState extends State<ChangeProfilePicturePage> {
  // Daftar asset gambar profil
  List<String> _profileImages = [
    'assets/images/profile.png.png',
    'assets/images/adidas.png',
    'assets/images/gucci.png',
    'assets/images/nike.png',
    'assets/images/jordan.png',
  ];

  // Indeks gambar profil saat ini
  int _currentIndex = 1;

  // Apakah gambar profil telah diubah
  bool _profileChanged = false;

  // Metode untuk mengubah gambar profil
  void _changeProfilePicture() {
    setState(() {
      // Tingkatkan indeks atau kembalikan ke nol jika sudah mencapai akhir
      _currentIndex = (_currentIndex + 1) % _profileImages.length;

      // Set gambar profil yang sesuai
      _profileImageAsset = _profileImages[_currentIndex];

      // Setel _profileChanged menjadi true ketika gambar profil diubah
      _profileChanged = true;
    });
  }

  // Variabel untuk menyimpan asset gambar profil
  late String _profileImageAsset;

  @override
  void initState() {
    super.initState();
    // Menginisialisasi gambar profil awal
    _profileImageAsset = _profileImages[_currentIndex];
  }

  // Method untuk mengembalikan gambar profil ke yang sebelumnya
  void _deleteProfileChange() {
    setState(() {
      _profileChanged = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Change Profile Picture'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(_profileImageAsset),
            ),
            SizedBox(height: 20),
            Text(
              'olshop_Sneaker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Olshop@Sneaker.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeProfilePicture,
              child: Text('Change Profile Picture'),
            ),
            if (_profileChanged)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Berhasil mengubah profil',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (_profileChanged)
              ElevatedButton(
                onPressed: _deleteProfileChange,
                child: Text('Delete'),
              ),
          ],
        ),
      ),
    );
  }
}
