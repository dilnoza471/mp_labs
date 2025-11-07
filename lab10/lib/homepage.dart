import 'package:flutter/material.dart';
import 'shape.dart';
import 'animated_box.dart';
import 'custom_title.dart';
import 'counter.dart';
import 'gesture_color_box.dart';
import 'moving_logo.dart';
import 'animated_box_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: ListView(
        children: [
          CustomTitle(text: 'Welcome to the Home Page', color: Colors.blue),
          const SizedBox(height: 20),
          CustomTitle(text: 'Shapes', color: Colors.blue),
          Shape(),
          CustomTitle(text: 'Custom Counter', color: Colors.blue),
          const Counter(),
          const SizedBox(height: 20),
          CustomTitle(text: 'Animated Container', color: Colors.blue),
          const AnimatedBox(),
          const SizedBox(height: 20),
          CustomTitle(text: 'Gesture Color Box', color: Colors.blue),
          const GestureColorBox(),
          const SizedBox(height: 20),
          CustomTitle(
            text: 'Moving logo  ',
            color: Theme.of(context).colorScheme.primary,
          ),
          MovingLogo(),
          const SizedBox(height: 20),
          CustomTitle(text: 'Animated List ', color: Colors.blue),
          AnimatedBoxList(),
        ],
      ),
    );
  }
}
