import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  "https://images.unsplash.com/photo-1532635867775-b6bbb158072d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Container(height: 0.3, color: Colors.grey),
          ProfileItem(icon: Icons.person_outline, title: "John Smith"),
          Container(height: 0.3, color: Colors.grey),
          ProfileItem(icon: Icons.mail_outline, title: "johnsmith@domain.com"),
          Container(height: 0.3, color: Colors.grey),
          ProfileItem(icon: Icons.phone_android, title: "+91 8827987615"),
          Container(height: 0.3, color: Colors.grey),
          ProfileItem(icon: Icons.lock_outline, title: "Change password"),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;

  ProfileItem({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue,
            size: 20,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(color: Colors.grey[700]),
          )
        ],
      ),
    );
  }
}
