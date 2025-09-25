import 'dart:ui';

import 'package:hive/hive.dart';

class ColorAdapter extends TypeAdapter<Color> {
  @override
  final int typeId = 100; // Choose a unique typeId for your adapter

  @override
  Color read(BinaryReader reader) {
    return Color(reader.readInt()); // Read the integer value and convert to Color
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer.writeInt(obj.toARGB32()); // Write the integer value of the Color
  }
}