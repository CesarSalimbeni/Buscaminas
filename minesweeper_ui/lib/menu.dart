import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minesweeper_ui/config.dart';
import 'package:minesweeper_ui/partidaez.dart';
import 'package:minesweeper_ui/partidamed.dart';
import 'package:minesweeper_ui/partidadif.dart';
import 'package:minesweeper_ui/tut.dart';
import 'estilo.dart';

class PantallaMenu extends StatefulWidget {
  const PantallaMenu({super.key});

  @override
  State<PantallaMenu> createState() => _PantallaMenuState();
}

class _PantallaMenuState extends State<PantallaMenu> {
  Dificultad _activeDifficulty = Dificultad.facil;

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
                  Widget targetPage;
                  switch (_activeDifficulty) {
                    case Dificultad.facil:
                      targetPage = const PantallaPartidaEz();
                      break;
                    case Dificultad.medio:
                      targetPage = const PantallaPartidaMed(); // Matches your partidamed.dart file
                      break;
                    case Dificultad.dificil:
                      targetPage = const PantallaPartidaDif(); // Matches your partidadif.dart file
                      break;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => targetPage),
                  );
                }, fontSize),
                _menuButton(context, 'High Scores', () {}, fontSize),
                
                // CONFIGURACIÓN BUTTON (STATE INTERCHANGE ACTION)
                _menuButton(context, 'Configuración', () async {
                  final result = await Navigator.push<Dificultad>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PantallaConfig(initialDifficulty: _activeDifficulty),
                    ),
                  );
                  if (result != null) {
                    setState(() {
                      _activeDifficulty = result;
                    });
                  }
                }, fontSize),
                
                _menuButton(context, 'Tutorial', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaTut()));
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