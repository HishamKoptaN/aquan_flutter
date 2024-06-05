import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:flutter/material.dart';

const cartHeading = TextStyle(
  color: black,
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

class StyleColors {
  static Color primary =
      Color(int.parse(Storage.getString('color') ?? "FFBF00", radix: 16));

  static Color secondary =
      Color(int.parse(Storage.getString('color') ?? "FFBF00", radix: 16))
          .withAlpha(200);
  static Color third =
      Color(int.parse(Storage.getString('color') ?? "FFBF00", radix: 16))
          .withAlpha(255);

  static init() {
    primary =
        Color(int.parse(Storage.getString('color') ?? "FFBF00", radix: 16));
    secondary =
        Color(int.parse(Storage.getString('color') ?? "FFBF00", radix: 16))
            .withAlpha(200);
    third = Color(int.parse(Storage.getString('color') ?? "FFBF00", radix: 16))
        .withAlpha(255);
  }
}
