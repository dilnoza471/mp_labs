import 'package:flutter/material.dart';
import 'get_screen.dart';
import 'post_screen.dart';
import 'currency_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 7',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeNavigation(),
    );
  }
}

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    GetScreen(),
    PostScreen(),      // second page named "Post"
    CurrencyScreen(),  // third page named "Currency"
  ];

  static const List<String> _titles = <String>[
    'GET',
    'Post',
    'Currency',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.download), label: 'GET'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Post'),
          BottomNavigationBarItem(icon: Icon(Icons.currency_exchange), label: 'Currency'),
        ],
      ),
    );
  }
}