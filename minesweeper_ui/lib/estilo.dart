import 'package:flutter/material.dart';

class ColorsPalette{
  static Color get normalText => const Color(0xFF7F7660);
  static Color get hoverText => const Color.fromARGB(255, 80, 74, 63);
}

class EstilosBuscaminas {
  static TextStyle numero(int adyacentes, String tiponmro) {
    Color color;
    switch (adyacentes) {
      case 1: color = Colors.blue.shade700; 
      case 2: color = Colors.green.shade700;
      case 3: color = Colors.red.shade700;
      default: color = Colors.orange.shade700;
    }
    String? fuente;

    if (tiponmro == 'retro'){
      color = ColorsPalette.normalText;
      fuente = 'PixelifySans';
    } else if (tiponmro == 'colorido'){
      switch (adyacentes) {
        case 1: color = Color(0xFFF3EAF4); 
        case 2: color = Color(0xFFFFD97D);
        case 3: color = Color(0xFFFF7477);
        default: color = Color(0xFF69140F);
    }
    } else if (tiponmro == 'minimalista'){
      color = ColorsPalette.normalText;
      fuente = 'Butler';
    }
    return TextStyle(fontSize: 90, fontWeight: FontWeight.bold, color: color, fontFamily: fuente);
  }
}
