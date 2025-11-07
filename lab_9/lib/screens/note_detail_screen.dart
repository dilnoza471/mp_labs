import 'package:flutter/material.dart';
import '../models/note.dart';
import '../db/database_helper.dart';

class NoteDetailScreen extends StatefulWidget {
  // Accept an optional Note. If null -> creating a new note.
  final Note? note;
  const NoteDetailScreen({super.key, this.note});

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtl = TextEditingController();
  final _contentCtl = TextEditingController();
  final DatabaseHelper _db = DatabaseHelper.instance;
  bool _saving = false;

  bool get _isNew => widget.note == null;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleCtl.text = widget.note!.title;
      _contentCtl.text = widget.note!.content;
    }
  }

  @override
  void dispose() {
    _titleCtl.dispose();
    _contentCtl.dispose();
    super.dispose();
  }

  Future<void> _saveNote() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);

    final title = _titleCtl.text.trim();
    final content = _contentCtl.text.trim();

    try {
      if (_isNew) {
        final note = Note(title: title, content: content);
        await _db.insertNote(note);
      } else {
        final note = Note(id: widget.note!.id, title: title, content: content);
        await _db.updateNote(note);
      }
      Navigator.pop(context, true); // indicate changed
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Save failed: ${e.toString()}')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _deleteNote() async {
    if (_isNew || widget.note?.id == null) return;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Delete note'),
        content: const Text('Are you sure you want to delete this note?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(c, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(c, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirm != true) return;

    try {
      await _db.deleteNote(widget.note!.id!);
      Navigator.pop(context, true); // indicate changed
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Delete failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isNew ? 'New Note' : 'Edit Note'),
        actions: [
          if (!_isNew)
            IconButton(icon: const Icon(Icons.delete), onPressed: _deleteNote),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleCtl,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Enter a title' : null,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: TextFormField(
                  controller: _contentCtl,
                  decoration: const InputDecoration(labelText: 'Content'),
                  maxLines: null,
                  expands: true,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saving ? null : _saveNote,
                  child: _saving
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
