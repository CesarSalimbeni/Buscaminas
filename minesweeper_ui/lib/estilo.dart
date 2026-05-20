import 'package:flutter/material.dart';

class ColorsPalette{
  static Color get normalText => const Color(0xFF7F7660);
  static Color get hoverText => const Color.fromARGB(255, 80, 74, 63);
}

class EstilosBuscaminas {
  static TextStyle numero(int adyacentes) {
    Color color;
    switch (adyacentes) {
      case 1: color = Colors.blue.shade700; break;
      case 2: color = Colors.green.shade700; break;
      case 3: color = Colors.red.shade700; break;
      default: color = Colors.orange.shade700;
    }
    return TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color);
  }
}
