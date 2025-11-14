import 'package:flutter/material.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // return to login screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Login()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Hello $email',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}