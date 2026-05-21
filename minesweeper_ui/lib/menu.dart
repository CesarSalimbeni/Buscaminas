import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minesweeper_ui/config.dart';
import 'package:minesweeper_ui/gestionDatos.dart';
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
  String _activeNmros = 'Clásico';

  @override
  void initState() {
    super.initState();
    _cargarConfiguracion();
  }

  Future<void> _cargarConfiguracion() async {
    final config = await GestionDatos.obtenerConfiguracion();
    if (config == null) return;
    setState(() {
      final dificultad = config['dificultad'] as String;
      _activeDifficulty = switch (dificultad) {
        'facil' => Dificultad.facil,
        'medio' => Dificultad.medio,
        'dificil' => Dificultad.dificil,
        _ => _activeDifficulty,
      };
      _activeNmros = config['estiloNumeros'] as String;
    });
  }

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
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) {
        // We move the instantiation directly INSIDE the builder function!
        // This forces Flutter to read the absolute freshest value of _activeNmros every single time the button is pressed.
                  switch (_activeDifficulty) {
                  case Dificultad.facil:
                    return PantallaPartidaEz(estiloNumeros: _activeNmros);
                  case Dificultad.medio:
                    return PantallaPartidaMed(estiloNumeros: _activeNmros); 
                  case Dificultad.dificil:
                    return PantallaPartidaMed(estiloNumeros: _activeNmros);
                  }
                  },
                  ),
                  );
                }, fontSize),
                _menuButton(context, 'High Scores', () {}, fontSize),
                
                // CONFIGURACIÓN BUTTON (STATE INTERCHANGE ACTION)
                _menuButton(context, 'Configuración', () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PantallaConfig(initialDifficulty: _activeDifficulty),
                    ),
                  );
                  if (result != null && result is Map) {
                    setState(() {
                      _activeDifficulty = result['dificultad'];
                      _activeNmros = result['numeros'];
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