import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final Color? color;
  TextEditingController? controller;
  final bool obscure;
  final String? label, hint;
  final IconData? prefixIcon;
  FocusNode? focusNode;
  final int? maxLines, minLines;
  final bool enabled, readOnly;
  final void Function(String)? onSubmitted, onChanged, onUnfocus;

  CustomTextFieldWidget({
    super.key,
    this.controller,
    this.obscure = false,
    this.label,
    this.hint,
    this.prefixIcon,
    this.onSubmitted,
    this.focusNode,
    this.maxLines = 1,
    this.minLines,
    this.color,
    this.onChanged,
    this.onUnfocus,
    this.enabled = true,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    focusNode ??= FocusNode();
    controller ??= TextEditingController();

    focusNode!.addListener(() {
      if (!focusNode!.hasFocus) {
        onUnfocus?.call(controller!.text);
      }
    });

    return Container(
      color: color,
      child: TextField(
        readOnly: readOnly,
        enabled: enabled,
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        focusNode: focusNode,
        obscureText: obscure,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true,
          hintText: hint,
          hintStyle: TextStyle(color: kPrimaryColor),
          labelStyle: TextStyle(color: kPrimaryColor),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
