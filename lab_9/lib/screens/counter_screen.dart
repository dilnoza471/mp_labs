import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  static const routeName = '/counter';
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _loadCount();
  }

  Future<void> _loadCount() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _count = prefs.getInt('counter') ?? 0);
  }

  Future<void> _setCount(int v) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', v);
    setState(() => _count = v);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Persistent Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Count: $_count', style: TextStyle(fontSize: 30)),
            SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => _setCount(_count - 1),
                  child: Text('-'),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => _setCount(_count + 1),
                  child: Text('+'),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => _setCount(0),
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
