import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({
    super.key,
    required this.name,
    required this.username,
    required this.bio,
  });
  final String name;
  final String username;
  final String bio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // light grey background
        borderRadius: BorderRadius.circular(12), // rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row with avatar + username column
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                child: Text("A", style: TextStyle(fontSize: 32)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      style: TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      name,
                    ),
                    Text(
                      username,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Bio text
          Text(style: TextStyle(fontSize: 30), bio),

          const SizedBox(height: 20),

          // Buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(fixedSize: const Size(130, 40)),
                onPressed: () {},
                icon: const Icon(Icons.person_add),
                label: const Text('Follow'),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(fixedSize: const Size(130, 40)),
                onPressed: () {},
                icon: const Icon(Icons.message),
                label: const Text('Message'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
