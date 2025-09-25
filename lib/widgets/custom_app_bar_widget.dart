import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon_widget.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onIconTap;

  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.icon,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        if(icon != null) CustomIconWidget(icon: icon!, onTap: onIconTap),
      ],
    );
  }
}
