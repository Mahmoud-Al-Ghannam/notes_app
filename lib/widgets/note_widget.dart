import 'dart:math';

import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

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
                  "This is a title",
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
              "Content \n lsjdfs slkdjf s sljdfkl s\n\n\n sjdfs lsjf \n\n\n\n\n\n\n\n\n\n\n\n\n\nksjf isf shf l",
              style: TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
            ),
            SizedBox(height: 8),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
