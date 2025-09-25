import 'package:flutter/material.dart';

class ColorChipWidget extends StatelessWidget {
  final Color color;
  final bool selected;

  const ColorChipWidget({
    super.key,
    required this.color,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: selected ? BoxBorder.all(color: Colors.white, width: 3) : null,
      ),
    );
  }
}
