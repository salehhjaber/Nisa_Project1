import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // body: Center(
      //   child: Text('This is the settings page.'),
      // ),

        body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Notification Settings'),
            leading: Icon(Icons.notifications),
            onTap: () {
              // Action when notification settings is tapped
            },
          ),
          ListTile(
            title: Text('Change Password'),
            leading: Icon(Icons.lock),
            onTap: () {
              // Action when change password is tapped
            },
          ),
          ListTile(
            title: Text('Change Profile Picture'),
            leading: Icon(Icons.image),
            onTap: () {
              // Action when change profile picture is tapped
            },
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              // Action when logout is tapped
            },
          ),
        ],
      ),
    );
  }
}