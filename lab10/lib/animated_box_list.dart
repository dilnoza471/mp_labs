import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedBoxList extends StatefulWidget {
  const AnimatedBoxList({super.key});

  @override
  State<AnimatedBoxList> createState() => _AnimatedBoxListState();
}

class _AnimatedBoxListState extends State<AnimatedBoxList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<int> _items = [];
  final Random _random = Random();

  void _addItem() {
    final index = _items.length;
    _items.add(index);
    _listKey.currentState?.insertItem(
      index,
      duration: const Duration(milliseconds: 400),
    );
  }

  Color _randomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  double _randomSize() => 60 + _random.nextInt(80).toDouble();

  Widget _buildItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    final color = _randomColor();
    final size = _randomSize();

    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          'Box ${_items[index]}',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _items.length,
                itemBuilder: _buildItem,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: FloatingActionButton(
                onPressed: _addItem,
                mini: true,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
