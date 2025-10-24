import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final Map<String, dynamic> post;
  const PostDetails({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final title = post['title']?.toString() ?? '';
    final body = post['body']?.toString() ?? '';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              Text(body),
            ],
          ),
        ),
      ),
    );
  }
}