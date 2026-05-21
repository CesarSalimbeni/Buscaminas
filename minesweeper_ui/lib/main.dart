import 'package:flutter/material.dart';
import 'package:minesweeper_ui/gestionDatos.dart';
import 'package:minesweeper_ui/inicio.dart';

import 'package:flutter/material.dart';
// Make sure your imports for GestionDatos and PantallaInicio are here!
// import 'gestion_datos.dart';
// import 'pantalla_inicio.dart';

// 1. THE GLOBAL BROADCASTER
// It starts as system default, but we will change it if they have a saved preference
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = await GestionDatos.obtenerConfiguracion();
  
  if (config != null) {
    String savedTheme = config['tema'] ?? 'Automático';
    if (savedTheme == 'Claro') {
      themeNotifier.value = ThemeMode.light;
    } else if (savedTheme == 'Oscuro') {
      themeNotifier.value = ThemeMode.dark;
    } else {
      themeNotifier.value = ThemeMode.system;
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode currentMode, child) {
        return MaterialApp(
          theme: ThemeData.light().copyWith(
             scaffoldBackgroundColor: Colors.white,
          ),
          darkTheme: ThemeData.dark().copyWith(
             scaffoldBackgroundColor: const Color(0xFF464549), 
          ),
          themeMode: currentMode, 
          home: const PantallaInicio()
        );
      },
    );
  }
}
