import 'package:flutter/material.dart';

class ColorsPalette{
  static Color get normalText => const Color(0xFF7F7660);
  static Color get hoverText => const Color.fromARGB(255, 80, 74, 63);
}

class EstilosBuscaminas {
  static TextStyle numero(int adyacentes, String tiponmroRaw) {
    String tiponmro = tiponmroRaw.trim();

    Color color;
    switch (adyacentes) {
      case 1: color = Colors.blue.shade700; 
      break;
      case 2: color = Colors.green.shade700;
      break;
      case 3: color = Colors.red.shade700;
      break;
      default: color = Colors.orange.shade700;
    }
    String? fuente;

    if (tiponmro == 'Retro'){
      color = Colors.black;
      fuente = 'PixelifySans';
    } else if (tiponmro == 'Colorido'){
      switch (adyacentes) {
        case 1: color = Color(0xFFF3EAF4); 
        break;
        case 2: color = Color(0xFFFFD97D);
        break;
        case 3: color = Color(0xFFFF7477);
        break;
        default: color = Color(0xFF69140F);
    }
    } else if (tiponmro == 'Minimalista'){
      color = Colors.black;
      fuente = 'Butler';
    }
    return TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: color, fontFamily: fuente);
  }
}
