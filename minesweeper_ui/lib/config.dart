import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minesweeper_ui/gestionDatos.dart';
import 'package:minesweeper_ui/main.dart';
import 'estilo.dart';

enum Dificultad { facil, medio, dificil }
enum Nmros { clasico, colorido, retro, minimalista }
enum Tema { claro, oscuro, automatico }

class PantallaConfig extends StatefulWidget {
  final Dificultad initialDifficulty;
  const PantallaConfig({super.key, required this.initialDifficulty});

  @override
  State<PantallaConfig> createState() => _PantallaConfigState();
}

class _PantallaConfigState extends State<PantallaConfig> {
  late Dificultad _selectedDificultad;
  String _selectedNmros = "Clásico";
  Tema _selectedTema = Tema.claro;

  @override
  void initState() {
    super.initState();
    _selectedDificultad = widget.initialDifficulty;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final titleFontSize = (min(width, height) * 0.06).clamp(28.0, 48.0) as double;
    final sectionFontSize = (min(width, height) * 0.045).clamp(20.0, 36.0) as double;
    final labelFontSize = (min(width, height) * 0.04).clamp(16.0, 28.0) as double;
    final buttonFontSize = (min(width, height) * 0.035).clamp(14.0, 22.0) as double;
    final horizontalPadding = max(16.0, width * 0.05);
    final sectionSpacing = max(20.0, height * 0.03);

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
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 18),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () async {
                          await _guardarConfiguracion();
                          Navigator.pop(context, {
                            'dificultad': _selectedDificultad,
                            'numeros': _selectedNmros,
                          });
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                            if (states.contains(MaterialState.hovered)) {
                              return ColorsPalette.hoverText;
                            }
                            return ColorsPalette.normalText;
                          }),
                        ),
                        child: Text('<- Regresar', style: TextStyle(fontSize: buttonFontSize + 4)),
                      ),
                    ),
                    SizedBox(height: sectionSpacing),
                    Text(
                      'CONFIGURACIÓN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsPalette.normalText,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: sectionSpacing * 0.8),

                    _buildSectionTitle('DIFICULTAD', sectionFontSize),
                    const SizedBox(height: 12),
                    _buildSegmentedButton<Dificultad>(
                      context: context,
                      selected: {_selectedDificultad},
                      segments: [
                        ButtonSegment(value: Dificultad.facil, label: Text('Fácil: 6x6', style: TextStyle(fontSize: labelFontSize))),
                        ButtonSegment(value: Dificultad.medio, label: Text('Medio: 8x8', style: TextStyle(fontSize: labelFontSize))),
                        ButtonSegment(value: Dificultad.dificil, label: Text('Difícil: 10x10', style: TextStyle(fontSize: labelFontSize))),
                      ],
                      onSelectionChanged: (selection) {
                        setState(() => _selectedDificultad = selection.first);
                      },
                    ),
                    SizedBox(height: sectionSpacing),

                    _buildSectionTitle('NÚMEROS', sectionFontSize),
                      const SizedBox(height: 12), 

                    _buildSegmentedButton<String>(
                      context: context,
                      selected: {_selectedNmros},
                      segments: [
                      ButtonSegment(value: 'Clásico', 
                      label: Text('Clásico', style: TextStyle(fontSize: labelFontSize))),
                      ButtonSegment(value: 'Colorido', 
                      label: Text('Colorido', style: TextStyle(fontSize: labelFontSize))),
                      ButtonSegment(value: 'Minimalista', 
                      label: Text('Minimalista', style: TextStyle(fontSize: labelFontSize))),
                      ButtonSegment(value: 'Retro', 
                      label: Text('Retro', style: TextStyle(fontSize: labelFontSize))),
                      ],
                      onSelectionChanged: (selection) {
                      setState(() {
                      _selectedNmros = selection.first;
                      });},),
                    SizedBox(height: sectionSpacing),

                    _buildSectionTitle('EFECTOS', sectionFontSize),
                    const SizedBox(height: 12),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 16,
                      runSpacing: 10,
                      children: [
                        _buildOptionLabel('Sonidos', labelFontSize),
                        _buildOptionLabel('Animaciones', labelFontSize),
                      ],
                    ),
                    SizedBox(height: sectionSpacing),

                    _buildSectionTitle('TEMA', sectionFontSize),
                    const SizedBox(height: 12),
                    _buildSegmentedButton<Tema>(
                    context: context,
                    selected: {_selectedTema},
                    segments: [
                      ButtonSegment(value: Tema.claro, 
                      label: Text('Claro', style: TextStyle(fontSize: labelFontSize))),
                      ButtonSegment(value: Tema.oscuro, 
                      label: Text('Oscuro', style: TextStyle(fontSize: labelFontSize))),
                      ButtonSegment(value: Tema.automatico, 
                      label: Text('Automático', style: TextStyle(fontSize: labelFontSize))),
                    ],
                    onSelectionChanged: (selection) {
                      setState(() => _selectedTema = selection.first);
                      if (_selectedTema == Tema.claro) {
                        themeNotifier.value = ThemeMode.light;
                      } else if (_selectedTema == Tema.oscuro) {
                        themeNotifier.value = ThemeMode.dark;
                      } else {
                        themeNotifier.value = ThemeMode.system; // Automático
                      }
                    },
                  ),
                    SizedBox(height: sectionSpacing),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _guardarConfiguracion() async {
    final temaTexto = switch (_selectedTema) {
      Tema.claro => 'Claro',
      Tema.oscuro => 'Oscuro',
      Tema.automatico => 'Automático',
    };

    await GestionDatos.guardarConfiguracion(
      dificultad: _selectedDificultad.name,
      tema: temaTexto,
      estiloNumeros: _selectedNmros,
      animacionesActivas: false,
    );
  }

  Widget _buildSectionTitle(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        color: ColorsPalette.normalText,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildOptionLabel(String text, double fontSize) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0x44000000),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsPalette.normalText.withOpacity(0.3)),
      ),
      child: Text(text, style: TextStyle(color: ColorsPalette.normalText, fontSize: fontSize)),
    );
  }

  Widget _buildSegmentedButton<T>({
    required BuildContext context,
    required Set<T> selected,
    required List<ButtonSegment<T>> segments,
    required ValueChanged<Set<T>> onSelectionChanged,
  }) {
    return SegmentedButton<T>(
      segments: segments,
      selected: selected,
      onSelectionChanged: onSelectionChanged,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(ColorsPalette.normalText),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: Color(0xFF565042), width: 1.0),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) {
            return const Color(0xFF565042);
          }
          return Colors.transparent;
        }),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        ),
      ),
    );
  }
}