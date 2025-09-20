import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel note;
  final Color color;
  final void Function()? onDeleteIconTap, onTap;

  const NoteWidget({
    super.key,
    required this.note,
    this.onDeleteIconTap,
    this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color,
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
                    onPressed: onDeleteIconTap,
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
      ),
    );
  }
}
