import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Persistence Demo')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Shared Preferences (username)'),
            onTap: () => Navigator.pushNamed(context, '/shared_prefs'),
          ),
          ListTile(
            title: Text('Counter (persisted)'),
            onTap: () => Navigator.pushNamed(context, '/counter'),
          ),
          ListTile(
            title: Text('Notes (SQLite)'),
            onTap: () => Navigator.pushNamed(context, '/notes'),
          ),
          ListTile(
            title: Text('File Storage Demo'),
            onTap: () => Navigator.pushNamed(context, '/files'),
          ),
        ],
      ),
    );
  }
}
