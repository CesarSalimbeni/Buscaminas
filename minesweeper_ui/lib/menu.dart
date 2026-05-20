import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minesweeper_ui/config.dart';
import 'package:minesweeper_ui/partidaez.dart';
import 'package:minesweeper_ui/tut.dart';
import 'estilo.dart';

class PantallaMenu extends StatelessWidget {
  const PantallaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontSize = min(size.width * 0.11, size.height * 0.11).clamp(28.0, 96.0) as double;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _menuButton(context, 'Jugar', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaPartidaEz()));
                }, fontSize),
                _menuButton(context, 'High Scores', () {}, fontSize),
                _menuButton(context, 'Configuración', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaConfig()));
                }, fontSize),
                _menuButton(context, 'Tutorial', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaTut()));
                }, fontSize),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuButton(BuildContext context, String label, VoidCallback onPressed, double fontSize) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.hovered)) {
            return ColorsPalette.hoverText;
          }
          return ColorsPalette.normalText;
        }),
      ),
      child: Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize)),
    );
  }
}