import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Login/Signup'),
            accountEmail: Text('yashvarshney304@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('assets/images/Untitled.jpg')),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background1.webp'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
              leading: Icon(Icons.people), title: Text('About'), onTap: null),
          ListTile(
              leading: Icon(Icons.school),
              title: Text('Education'),
              onTap: null),
          ListTile(
              leading: Icon(Icons.explore),
              title: Text('Experience'),
              onTap: null),
          ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Contact us'),
              onTap: null),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
          ),
        ],
      ),
    );
  }
}
