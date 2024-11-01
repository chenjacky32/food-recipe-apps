import 'package:flutter/material.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF042628),
        title: Text('Profile Pages',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Bagian Header Profil
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/IMG_4357.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Jacky Chen',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF0A2533),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Chenjacky32@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),

            // Bagian Opsi Pengaturan
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading:
                        const Icon(Icons.favorite, color: Color(0XFF70B9BE)),
                    title: const Text('Favorite Recipes'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigasi ke halaman Favorit
                    },
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.settings, color: Color(0XFF70B9BE)),
                    title: const Text('Settings'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigasi ke halaman Settings
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help, color: Color(0XFF70B9BE)),
                    title: const Text('Help & Support'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigasi ke halaman Help
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text('Logout'),
                    onTap: () {
                      // Tambahkan logika logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
