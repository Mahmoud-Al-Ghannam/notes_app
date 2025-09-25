import 'package:flutter/material.dart';
import 'package:notes_app/widgets/color_chip_widget.dart';

class SelectableColorListWidget extends StatefulWidget {
  final int initialSelectedIndex;
  final List<Color> colors;
  final void Function(int, Color)? onSelected;

  const SelectableColorListWidget({
    super.key,
    this.initialSelectedIndex = 0,
    required this.colors,
    this.onSelected,
  });

  @override
  State<SelectableColorListWidget> createState() =>
      _SelectableColorListWidgetState();
}

class _SelectableColorListWidgetState extends State<SelectableColorListWidget> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List<Widget>.generate(widget.colors.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                selectedIndex = index;
                widget.onSelected?.call(index, widget.colors[index]);
                setState(() {});
              },
              child: IntrinsicHeight(
                child: ColorChipWidget(
                  color: widget.colors[index],
                  selected: index == selectedIndex,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
