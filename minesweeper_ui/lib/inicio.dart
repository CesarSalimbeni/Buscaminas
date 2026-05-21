import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minesweeper_ui/gestionDatos.dart';
import 'package:minesweeper_ui/menu.dart';
import 'estilo.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  late Future<Map<String, dynamic>?> _configFuture;

  @override
  void initState() {
    super.initState();
    _configFuture = GestionDatos.obtenerConfiguracion();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleFontSize = min(size.width * 0.12, size.height * 0.14).clamp(32.0, 128.0) as double;
    final buttonFontSize = min(size.width * 0.07, size.height * 0.08).clamp(18.0, 48.0) as double;
    final imageWidth = min(size.width * 0.5, 300.0);

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
        child: Stack(
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Buscaminas Flutter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsPalette.normalText,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FutureBuilder<Map<String, dynamic>?>(
                      future: _configFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Text(
                            'No se pudo cargar la configuración',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorsPalette.normalText, fontSize: buttonFontSize * 0.9),
                          );
                        }
                        final config = snapshot.data;
                        if (config == null) {
                          return Text(
                            'Aún no hay configuración guardada.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorsPalette.normalText, fontSize: buttonFontSize * 0.9),
                          );
                        }
                        return Column(
                          children: [
                            _buildConfigSummary('Dificultad', _formatDifficulty(config['dificultad'] as String)),
                            const SizedBox(height: 8),
                            _buildConfigSummary('Tema', config['tema'] as String),
                            const SizedBox(height: 8),
                            _buildConfigSummary('Números', config['estiloNumeros'] as String),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaMenu()));
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(ColorsPalette.normalText),
                      ),
                      child: Text(
                        'Continuar',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: buttonFontSize),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: imageWidth,
                  child: Image.asset('assets/images/velitas.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigSummary(String label, String value) {
    return Text(
      '$label: $value',
      textAlign: TextAlign.center,
      style: TextStyle(color: ColorsPalette.normalText, fontSize: 18.0),
    );
  }

  String _formatDifficulty(String dificultad) {
    return switch (dificultad) {
      'facil' => 'Fácil',
      'medio' => 'Medio',
      'dificil' => 'Difícil',
      _ => dificultad,
    };
  }
}