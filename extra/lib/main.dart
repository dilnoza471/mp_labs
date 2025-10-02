import 'package:flutter/material.dart';

const String firstRoute = '/firstRoute';
const String secondRoute = '/secondRoute';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Two Routes Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      // initial route
      initialRoute: firstRoute,
      routes: {
        firstRoute: (context) => const FirstRouteScreen(),
        secondRoute: (context) => const SecondRouteScreen(),
      },
    );
  }
}

/// First route: TabBar with 5 tabs and TabBarView for swipe/transition animations.
class FirstRouteScreen extends StatelessWidget {
  const FirstRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('First Route - TabBar (5 tabs)'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.looks_one), text: 'One'),
              Tab(icon: Icon(Icons.looks_two), text: 'Two'),
              Tab(icon: Icon(Icons.looks_3), text: 'Three'),
              Tab(icon: Icon(Icons.looks_4), text: 'Four'),
              Tab(icon: Icon(Icons.looks_5), text: 'Five'),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(
            5,
            (i) => Center(
              child: Card(
                margin: const EdgeInsets.all(24),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Tab ${i + 1}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'This is content for tab #${i + 1}.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, secondRoute),
                        child: const Text('Go to Second Route'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Second route: BottomNavigationBar with 5 items and AnimatedSwitcher between pages.
class SecondRouteScreen extends StatefulWidget {
  const SecondRouteScreen({super.key});

  @override
  State<SecondRouteScreen> createState() => _SecondRouteScreenState();
}

class _SecondRouteScreenState extends State<SecondRouteScreen> {
  int _currentIndex = 0;

  static const List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.camera_alt,
    Icons.notifications,
    Icons.person,
  ];

  static final List<MaterialColor> _colors = [
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.purple,
  ];

  void _onTap(int idx) {
    if (idx == _currentIndex) return;
    setState(() => _currentIndex = idx);
  }

  @override
  Widget build(BuildContext context) {
    final page = _buildPage(_currentIndex);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route - Bottom Navigation'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, firstRoute),
          tooltip: 'Back to First Route',
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          // combine fade and slide for a nicer effect
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(0.0, 0.1),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          5,
          (i) => BottomNavigationBarItem(
            icon: Icon(_icons[i]),
            label: 'Item ${i + 1}',
          ),
        ),
        onTap: _onTap,
      ),
    );
  }

  Widget _buildPage(int index) {
    // Use a ValueKey so AnimatedSwitcher knows it's a different child
    return Container(
      key: ValueKey<int>(index),
      color: _colors[index].withOpacity(0.15),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_icons[index], size: 96, color: _colors[index].shade700),
          const SizedBox(height: 16),
          Text(
            'Page ${index + 1}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, firstRoute),
            child: const Text('Back to First Route'),
          ),
        ],
      ),
    );
  }
}
