import 'package:flutter/material.dart';

class AnimatedBox extends StatefulWidget {
  const AnimatedBox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedBoxState createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _toggled = !_toggled;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: _toggled ? 200 : 100,
          height: _toggled ? 200 : 100,
          decoration: BoxDecoration(
            color: _toggled ? Colors.blue : Colors.orange,
            borderRadius: BorderRadius.circular(_toggled ? 40 : 10),
          ),
        ),
      ),
    );
  }
}
