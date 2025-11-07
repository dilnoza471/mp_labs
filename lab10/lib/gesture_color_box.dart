import 'package:flutter/material.dart';

class GestureColorBox extends StatefulWidget {
  const GestureColorBox({super.key});

  @override
  _GestureColorBoxState createState() => _GestureColorBoxState();
}

class _GestureColorBoxState extends State<GestureColorBox> {
  Color _color = Colors.grey;

  void _changeColor(Color newColor) {
    setState(() {
      _color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GestureDetector(
          onTap: () => _changeColor(Colors.blue),
          onDoubleTap: () => _changeColor(Colors.green),
          onLongPress: () => _changeColor(Colors.red),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: _color,
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: Text(
                "Tap / Double Tap / Long Press",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
