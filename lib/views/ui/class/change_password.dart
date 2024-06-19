import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Change Password'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Current Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter current password',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'New Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter new password',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Confirm New Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm new password',
              ),
            ),
            //
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                      var pswd = _newPasswordController.text;
                if (_currentPasswordController.text.isEmpty ||
                    _newPasswordController.text.isEmpty ||
                    _confirmPasswordController.text.isEmpty) {
                  setState(() {
                    _message = 'SILAHKAN ISI SEMUA KOLOM';
                  });
                } else if (_newPasswordController.text !=
                    _confirmPasswordController.text) {
                  setState(() {
                    _message = 'KATA SANDI TIDAK COCOK $pswd';
                  });
                } else if (_currentPasswordController.text ==
                    _newPasswordController.text) {
            
                  setState(() {
                    _message = 'KATA BOLEH SAMA $pswd';
                  });
                } else {
                  setState(() {
                    // _message = 'data $Widget._currentPasswordController';
                    // _message = 'SUCCESS: PASSWORD CHANGED';
                    _message = 'SUCCESS: PASSWORD CHANGED';
                  });
                  // Place your logic here to change the password
                }
              },
              child: Text('Change Password'),
            ),
            SizedBox(height: 8.0),
            Text(
              _message,
              style: TextStyle(
                color:
                    _message.startsWith('SUCCESS') ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
