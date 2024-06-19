import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          NotificationCard(
            title: 'Special Offer!',
            description: 'Get 20% off on all sneakers. Hurry up, limited time offer!',
            time: '2 hours ago',
            isNew: false,
          ),
          NotificationCard(
            title: 'New Arrivals',
            description: 'Check out our latest collection of sneakers.',
            time: 'Yesterday',
            isNew: false,
          ),
          NotificationCard(
            title: 'Order Shipped',
            description: 'Your order #12345 has been shipped. Track your order now!',
            time: '2 days ago',
            isNew: false,
          ),
          NotificationCard(
            title: 'Welcome Offer',
            description: 'Sign up now and get 10% off on your first purchase.',
            time: '1 week ago',
            isNew: false,
          ),
          NotificationCard(
            title: 'Flash Sale!',
            description: 'Exclusive flash sale on selected sneakers. Don\'t miss out!',
            time: '2 weeks ago',
            isNew: false,
          ),
          NotificationCard(
            title: 'New Feature!',
            description: 'Now you can customize your sneakers. Try it out!',
            time: '1 month ago',
            isNew: false,
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final bool isNew;

  NotificationCard({
    required this.title,
    required this.description,
    required this.time,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isNew ? Colors.blue : Colors.grey,
        child: Icon(
          isNew ? Icons.new_releases : Icons.notifications,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description),
          SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      onTap: () {
        // Handle notification tap
      },
    );
  }
}
    
