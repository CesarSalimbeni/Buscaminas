import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minesweeper_ui/highscores_ez.dart';
import 'package:minesweeper_ui/highscores_mid.dart';
import 'package:minesweeper_ui/menu.dart';
import 'estilo.dart';

class PantallaHsDif extends StatelessWidget {
  const PantallaHsDif({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 720;
    final titleFontSize = min(size.width * 0.08, size.height * 0.08).clamp(24.0, 80.0) as double;
    final buttonFontSize = min(size.width * 0.05, size.height * 0.05).clamp(18.0, 60.0) as double;
    final labelFontSize = min(size.width * 0.045, size.height * 0.045).clamp(16.0, 60.0) as double;
    final spacing = size.height * 0.02;

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
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaMenu()));
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                            if (states.contains(MaterialState.hovered)) {
                              return ColorsPalette.hoverText;
                            }
                            return ColorsPalette.normalText;
                          }),
                        ),
                        child: Text('<- Regresar', style: TextStyle(fontSize: max(16.0, buttonFontSize))),
                      ),
                    ),
                    SizedBox(height: spacing),
                    Text(
                      'HIGH SCORES',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsPalette.normalText,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: spacing),
                    isWide
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildModeButton(context, 'FÁCIL', () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaHsEz()));
                              }, buttonFontSize),
                              SizedBox(width: size.width * 0.03),
                              _buildModeButton(context, 'MEDIO', () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaHsMid()));
                              }, buttonFontSize),
                              SizedBox(width: size.width * 0.03),
                              Text(
                                'DIFÍCIL',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorsPalette.normalText, fontSize: buttonFontSize),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              _buildModeButton(context, 'FÁCIL', () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaHsEz()));
                              }, buttonFontSize),
                              SizedBox(height: 14),
                              _buildModeButton(context, 'MEDIO', () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaHsMid()));
                              }, buttonFontSize),
                              SizedBox(height: 14),
                              Text(
                                'DIFÍCIL',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorsPalette.normalText, fontSize: buttonFontSize),
                              ),
                            ],
                          ),
                    SizedBox(height: spacing * 2),
                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: spacing,
                      children: List.generate(
                        5,
                        (_) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Usuario',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorsPalette.normalText, fontSize: labelFontSize),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModeButton(BuildContext context, String label, VoidCallback onPressed, double fontSize) {
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
      child: Text(label, style: TextStyle(fontSize: fontSize)),
    );
  }
}