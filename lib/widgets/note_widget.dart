import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel note;


  const NoteWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(
        255,
        155 + Random().nextInt(100),
        155 + Random().nextInt(100),
        155 + Random().nextInt(100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  note.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.black, size: 32),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              note.content,
              style: TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
            ),
            SizedBox(height: 8),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: Text(
                note.createdAt.toString(),
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
