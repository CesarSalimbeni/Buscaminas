import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minesweeper_ui/menu.dart';
import 'estilo.dart';

class PantallaHsvacio extends StatelessWidget {
  const PantallaHsvacio({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleFontSize = min(size.width * 0.08, size.height * 0.07).clamp(20.0, 100.0) as double;
    final buttonFontSize = min(size.width * 0.06, size.height * 0.05).clamp(16.0, 60.0) as double;

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Aún no tienes registros. ¡Juega tu primera partida!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorsPalette.normalText,
                      fontSize: titleFontSize,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaMenu()));
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(ColorsPalette.normalText),
                    ),
                    child: Text(
                      'Regresar a menu',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: buttonFontSize),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}