import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

class NeontextModel {
  late double textSize;
  late String fontFamily;
  late double blurRadius;
  late Color spreadColor;
  late Color textColor;
  late String text;
  late VoidCallback onPressed;

  NeontextModel(this.textSize, this.fontFamily, this.blurRadius,
      this.spreadColor, this.text, this.textColor, this.onPressed);
}

Widget neonTextWidget(NeontextModel model) {
  return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: TextButton(
        onPressed: model.onPressed,
        child: NeonText(
          text: model.text,
          textColor: model.textColor,
          fontFamily: model.fontFamily,
          blurRadius: model.blurRadius,
          spreadColor: model.spreadColor,
          textSize: model.textSize,
        ),
      ));
}
