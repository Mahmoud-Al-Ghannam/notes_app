import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const CustomButtonWidget({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor,
        ),
        child: Center(
          child: Text(text, style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}