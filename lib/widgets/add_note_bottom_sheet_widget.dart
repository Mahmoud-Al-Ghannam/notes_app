import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import 'custom_button_widget.dart';
import 'custom_text_field_widget.dart';

class AddNoteBottomSheetWidget extends StatelessWidget {
  const AddNoteBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            CustomTextFieldWidget(label: "Title"),
            SizedBox(height: 16),
            CustomTextFieldWidget(label: "Content", maxLines: 10),
            SizedBox(height: 16),
            CustomButtonWidget(text: "Add"),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}


