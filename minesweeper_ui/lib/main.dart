import 'package:flutter/material.dart';
import 'package:minesweeper_ui/config.dart';
import 'package:minesweeper_ui/inicio.dart';
import 'package:minesweeper_ui/menu.dart';
import 'package:minesweeper_ui/numeros.dart';
import 'package:minesweeper_ui/partidadif.dart';
import 'package:minesweeper_ui/partidaez.dart';
import 'package:minesweeper_ui/partidamed.dart';
import 'package:minesweeper_ui/tut.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const PantallaInicio()
      home: PantallaInicio()
    );
  }
}
