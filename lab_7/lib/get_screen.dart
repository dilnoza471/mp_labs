import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post_details.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({super.key});

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  List<Map<String, dynamic>> _posts = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final response =
          await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded is List) {
          final list = List<Map<String, dynamic>>.from(
            decoded.map((e) => Map<String, dynamic>.from(e as Map)),
          );
          setState(() {
            _posts = list;
            _isLoading = false;
          });
        } else {
          setState(() {
            _error = 'Unexpected JSON format';
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _error = 'Failed to load data: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_error!),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: fetchData, child: const Text('Retry')),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            title: Text(post['title']?.toString() ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PostDetails(post: post),
                ),
              );
            },
          ),
        );
      },
    );
  }
}