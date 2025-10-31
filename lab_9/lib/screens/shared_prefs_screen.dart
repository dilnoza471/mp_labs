import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsScreen extends StatefulWidget {
  static const routeName = '/shared_prefs';
  const SharedPrefsScreen({super.key});

  @override
  State<SharedPrefsScreen> createState() => _SharedPrefsScreenState();
}

class _SharedPrefsScreenState extends State<SharedPrefsScreen> {
  final _controller = TextEditingController();
  String _saved = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _saved = prefs.getString('username') ?? '';
    });
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _controller.text);
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SharedPreferences')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 8),
            ElevatedButton(onPressed: _save, child: Text('Save')),
            SizedBox(height: 16),
            Text('Saved username: $_saved'),
          ],
        ),
      ),
    );
  }
}
