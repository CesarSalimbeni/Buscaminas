import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minesweeper_ui/menu.dart';
import 'estilo.dart';

class PantallaTut extends StatelessWidget {
  const PantallaTut({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 720;
    final titleFontSize = min(size.width * 0.08, size.height * 0.08).clamp(28.0, 60.0) as double;
    final subtitleFontSize = min(size.width * 0.05, size.height * 0.05).clamp(18.0, 45.0) as double;
    final sectionTitleSize = min(size.width * 0.045, size.height * 0.045).clamp(16.0, 40.0) as double;
    final bodyFontSize = min(size.width * 0.036, size.height * 0.036).clamp(14.0, 30.0) as double;

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
                        child: Text('<- Regresar', style: TextStyle(fontSize: max(16.0, buttonFontSizeFromWidth(size.width))), textAlign: TextAlign.left),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'TUTORIAL',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsPalette.normalText,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Descubre todas las casillas, pero ten precaución con las minas escondidas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsPalette.normalText,
                        fontSize: subtitleFontSize,
                      ),
                    ),
                    const SizedBox(height: 30),
                    isWide
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildSection('Instrucciones', [
                                '- Haz click en una casilla para revelarla',
                                '- Los números indican la cantidad de minas',
                                '- No hagas click en las casillas con minas',
                                '- Revela todas las minas para ganar',
                              ], sectionTitleSize, bodyFontSize)),
                              const SizedBox(width: 24),
                              Expanded(child: _buildSection('Dificultad', [
                                '- Fácil: cuadrícula 6x6, 10 minas',
                                '- Medio: cuadrícula 8x8, 20 minas',
                                '- Difícil: cuadrícula 10x10, 30 minas (o más)',
                              ], sectionTitleSize, bodyFontSize)),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildSection('Instrucciones', [
                                '- Haz click en una casilla para revelarla',
                                '- Los números indican la cantidad de minas',
                                '- No hagas click en las casillas con minas',
                                '- Revela todas las minas para ganar',
                              ], sectionTitleSize, bodyFontSize),
                              const SizedBox(height: 24),
                              _buildSection('Dificultad', [
                                '- Fácil: cuadrícula 6x6, 10 minas',
                                '- Medio: cuadrícula 8x8, 20 minas',
                                '- Difícil: cuadrícula 10x10, 30 minas (o más)',
                              ], sectionTitleSize, bodyFontSize),
                            ],
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

  double buttonFontSizeFromWidth(double width) {
    return min(width * 0.04, 24.0).clamp(14.0, 24.0);
  }

  Widget _buildSection(String title, List<String> items, double titleSize, double itemSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: ColorsPalette.normalText, fontSize: titleSize, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        for (final text in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorsPalette.normalText, fontSize: itemSize),
            ),
          ),
      ],
    );
  }
}
