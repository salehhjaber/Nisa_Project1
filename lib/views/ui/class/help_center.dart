import 'package:flutter/material.dart';
class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Help Center'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        // 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Help Center',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'If you need assistance, please contact our support team at support@Sneaker_Store.com',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
