import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field_widget.dart';

import '../widgets/custom_app_bar_widget.dart';

class EditNoteView extends StatelessWidget {
  static const String id = "EditNoteView";

  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBarWidget(title: "Edit", icon: Icons.check),
            SizedBox(height: 25),
            CustomTextFieldWidget(label: "Title",),
            SizedBox(height: 16),
            CustomTextFieldWidget(label: "Content",maxLines: 10,),
          ],
        ),
      ),
    );
  }
}
