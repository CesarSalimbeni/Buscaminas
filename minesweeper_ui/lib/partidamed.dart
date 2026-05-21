import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minesweeper_ui/buscaminas.dart';
import 'package:minesweeper_ui/estilo.dart';
import 'package:minesweeper_ui/gestionDatos.dart';

class PantallaPartidaMed extends StatefulWidget {
  const PantallaPartidaMed({super.key});

  @override
  State<PantallaPartidaMed> createState() => _PantallaPartidaMedState();
}

class _PantallaPartidaMedState extends State<PantallaPartidaMed>{
  late Buscaminas _juego;
  final int _filas = 8;
  final int _columnas = 8;
  final int _minas = 20;
  Timer? _cronometro;
  int _segundosTranscurridos = 0;

  @override
  void initState(){
    super.initState();
    _juego = Buscaminas(filas: _filas, columnas: _columnas, minas: _minas);
    _iniciarCronometro();
  }

  @override
  void dispose() {
    _cronometro?.cancel();
    super.dispose();
  }

  void _iniciarCronometro() {
    _cronometro?.cancel();
    _segundosTranscurridos = 0;
    _cronometro = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        _segundosTranscurridos++;
      });
    });
  }

  void _detenerCronometro() {
    _cronometro?.cancel();
    _cronometro = null;
  }

  String _formatearTiempo() {
    final minutos = _segundosTranscurridos ~/ 60;
    final segundos = _segundosTranscurridos % 60;
    return '${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}';
  }

  Future<void> _guardarRecord(String dificultad) async {
    await GestionDatos.guardarRecord(dificultad, _segundosTranscurridos * 1000);
  }

  Future<void> _procesarClick(int fila, int columna) async {
    if (_juego.juegoTerminado) return;

    setState(() {
      _juego.descubrirCelda(fila, columna);
    });

    if (_juego.juegoTerminado) {
      _detenerCronometro();
      if (_juego.gano) {
        await _guardarRecord('medio');
        _mostrarResultado('¡Ganaste!', 'Tiempo: ${_formatearTiempo()}');
      } else {
        _mostrarResultado('¡Perdiste!', 'Intentá de nuevo.');
      }
    }
  }

  void _mostrarResultado(String titulo, String mensaje) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _reiniciarPartida(){
    setState(() {
      _juego.reiniciar();
      _iniciarCronometro();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF464549),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final availableHeight = max(0.0, constraints.maxHeight - 120);
          final boardSize = min(min(constraints.maxWidth, availableHeight), 800.0);

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Tiempo: ${_formatearTiempo()}',
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                SizedBox(
                  width: boardSize,
                  height: boardSize,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _columnas,
                      childAspectRatio: 1,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                    itemCount: _filas * _columnas,
                    itemBuilder: (context, index) {
                      final fila = index ~/ _columnas;
                      final columna = index % _columnas;
                      final celda = _juego.obtenerCelda(fila, columna);

                      return GestureDetector(
                        onTap: () async {
                          await _procesarClick(fila, columna);
                        },
                        onLongPress: () {
                          setState(() {
                            _juego.alternarBandera(fila, columna);
                          });
                        },
                        child: _vistaCelda(celda),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

    Widget _vistaCelda(CeldaBuscaminas celda){
      if (celda.estaDescubierta){
        if (celda.mina){
          return Container(margin: EdgeInsets.all(2), decoration: const BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/images/bloque.jpg'), fit: BoxFit.cover)), 
              child: Padding(padding: EdgeInsets.all(0), child: Image.asset('assets/images/mina.png'))
          );
        } else{
          return Container(margin: EdgeInsets.all(2), decoration: const BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/images/bloque.jpg'), fit: BoxFit.cover)), 
              child: Center(child: Text('${celda.adyacentes}', style: EstilosBuscaminas.numero(celda.adyacentes, '')))
          );
        }
      } else {
        return Container(margin: EdgeInsets.all(2), decoration: const BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/images/bloque.jpg'), fit: BoxFit.cover)),
              child: celda.estaMarcada
              ? Padding(padding: EdgeInsets.all(0), child: Image.asset('assets/images/bandera.png'))
              :
              null
          );
      }
    }
}
