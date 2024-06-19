import 'package:flutter/material.dart';
import 'package:online_shop/views/shared/appstyle.dart';

import 'class/Setting_page.dart';
import 'class/change_password.dart';
import 'class/change_profile_picture.dart';
import 'class/help_center.dart';
import 'class/log_out.dart';
import 'class/notifications.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 74, 71, 71),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              // menampilkan gambar dari profile
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage('assets/images/profile.png.png'),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey)),
                title: Text(
                  'Change Profile Picture',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.image,
                  color: Colors.black,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                ),
                onTap: () {
                  // navigasi untuk mengubah halaman profile
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeProfilePicturePage()),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // a ListTile for changing password
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey)),
                title: Text(
                  'Change Password',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(Icons.lock, color: Colors.black),
                trailing: Icon(
                  Icons.arrow_forward,
                ),
                onTap: () {
                  // Navigasi untuk mengubah halaman password
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordPage()),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey)),
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // navigasi halaman pengaturan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
              // other list items for settings options
              const SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey)),
                title: Text(
                  'Notifications',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.notification_add,
                  color: Colors.black,
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Navigasi halaman notification
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey)),
                title: Text(
                  'Help Center',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.help,
                  color: Colors.black,
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Navigasi untuk halaman pusat bantuan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpCenterPage()),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey)),
                title: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogoutPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
