import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final title = _titleController.text.trim();
    final body = _bodyController.text.trim();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Post Preview'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: $title', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(body),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                final response = await http.post(
                  Uri.parse('https://reqres.in/api/posts'),
                  headers: {'Content-Type': 'application/json; charset=UTF-8'},
                  body: jsonEncode({'title': title, 'body': body, 'userId': 1}),
                );
                if (response.statusCode == 201) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Post submitted successfully.')),
                  );
                  _formKey.currentState!.reset();
                  _titleController.clear();
                  _bodyController.clear();
              
                } else {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to create post: ${response.statusCode}')),
                  );
                  
                }
              } catch (error) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error creating post: $error')),
                );
                
              }finally {
                dispose();
              }
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter a title' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _bodyController,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 6,
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter the body' : null,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}