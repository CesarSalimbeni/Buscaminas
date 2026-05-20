import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minesweeper_ui/highscores_dif.dart';
import 'package:minesweeper_ui/highscores_mid.dart';
import 'package:minesweeper_ui/menu.dart';
import 'estilo.dart';

class PantallaHsEz extends StatelessWidget {
  const PantallaHsEz({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 720;
    final titleFontSize = min(size.width * 0.08, size.height * 0.08).clamp(24.0, 80.0) as double;
    final buttonFontSize = min(size.width * 0.05, size.height * 0.05).clamp(18.0, 60.0) as double;
    final labelFontSize = min(size.width * 0.045, size.height * 0.045).clamp(16.0, 40.0) as double;
    final spacing = max(16.0, size.height * 0.02);

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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildLabel('FÁCIL', buttonFontSize),
                              _buildModeButton(context, 'MEDIO', () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaHsMid()));
                              }, buttonFontSize),
                              _buildModeButton(context, 'DIFÍCIL', () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaHsDif()));
                              }, buttonFontSize),
                            ],
                          )
                        : Column(
                            children: [
                              _buildLabel('FÁCIL', buttonFontSize),
                              SizedBox(height: 12),
                              _buildModeButton(context, 'MEDIO', () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaHsMid()));
                              }, buttonFontSize),
                              SizedBox(height: 12),
                              _buildModeButton(context, 'DIFÍCIL', () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaHsDif()));
                              }, buttonFontSize),
                            ],
                          ),
                    SizedBox(height: spacing * 1.5),
                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: spacing / 2,
                      spacing: 16,
                      children: List.generate(
                        5,
                        (_) => Text(
                          'Usuario',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: ColorsPalette.normalText, fontSize: labelFontSize),
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

  Widget _buildLabel(String label, double fontSize) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(color: ColorsPalette.normalText, fontSize: fontSize),
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