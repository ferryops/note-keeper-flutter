import 'package:flutter/material.dart';
import '../db/note_database.dart';
import '../models/note.dart';
import 'add_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await NoteDatabase.instance.readAllNotes();
    setState(() => _notes = notes);
  }

  Future<void> _deleteNote(int id) async {
    await NoteDatabase.instance.delete(id);
    _loadNotes();
  }

  void _navigateToAddNote() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddNoteScreen()),
    );
    if (result == true) _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note Keeper')),
      body:
          _notes.isEmpty
              ? const Center(child: Text('Belum ada catatan.'))
              : ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (_, index) {
                  final note = _notes[index];
                  return Dismissible(
                    key: Key(note.id.toString()),
                    onDismissed: (_) => _deleteNote(note.id!),
                    background: Container(color: Colors.red),
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(
                        note.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
