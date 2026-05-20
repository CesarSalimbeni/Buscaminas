import 'dart:math';

enum EstadoCelda { oculto, descubierto, bandera }

class CeldaBuscaminas {
  bool mina;
  int adyacentes;
  EstadoCelda estado;

  CeldaBuscaminas({this.mina = false, this.adyacentes = 0}) : estado = EstadoCelda.oculto;

  bool get estaDescubierta => estado == EstadoCelda.descubierto;
  bool get estaMarcada => estado == EstadoCelda.bandera;
}

class Buscaminas {
  final int filas;
  final int columnas;
  final int minas;

  late List<List<CeldaBuscaminas>> tablero;
  bool juegoTerminado = false;
  bool perdio = false;
  bool gano = false;
  bool _minasColocadas = false;

  /// Crea una instancia del juego Buscaminas con el número de filas, columnas y minas especificados.
  /*Fácil: cuadrícula 6×6, 10 minas.
    Medio: cuadrícula 8×8, 20 minas.
    Difícil: cuadrícula 10×10, 30 minas (o más).*/

  Buscaminas({required this.filas, required this.columnas, required this.minas}) {
    reiniciar();
  }

  /// Reinicia el juego, creando un nuevo tablero y restableciendo el estado.
  void reiniciar() {
    juegoTerminado = false;
    perdio = false;
    gano = false;
    _minasColocadas = false;
    _crearTablero();
  }

  /// Crea el tablero de juego como una matriz de celdas.
  void _crearTablero() {
    tablero = List.generate(
      filas,
      (_) => List.generate(columnas, (_) => CeldaBuscaminas()),
    );
  }

  /// Coloca las minas en el tablero, asegurando que la celda segura (safeFila, safeColumna)
  /// y sus celdas vecinas no contengan minas.
  void _colocarMinas(int safeFila, int safeColumna) {
    final rng = Random();
    final totalCeldas = filas * columnas;
    final posiciones = List<int>.generate(totalCeldas, (index) => index);

    final safePosiciones = <int>{};
    for (var dFila = -1; dFila <= 1; dFila++) {
      for (var dColumna = -1; dColumna <= 1; dColumna++) {
        final nFila = safeFila + dFila;
        final nColumna = safeColumna + dColumna;
        if (_estaDentro(nFila, nColumna)) {
          safePosiciones.add(nFila * columnas + nColumna);
        }
      }
    }

    posiciones.removeWhere(safePosiciones.contains);
    posiciones.shuffle(rng);

    for (var i = 0; i < minas && i < posiciones.length; i++) {
      final fila = posiciones[i] ~/ columnas;
      final columna = posiciones[i] % columnas;
      tablero[fila][columna].mina = true;
    }
  }

  /// Calcula el número de minas adyacentes para cada celda del tablero.
  void _calcularAdyacentes() {
    for (var fila = 0; fila < filas; fila++) {
      for (var columna = 0; columna < columnas; columna++) {
        if (tablero[fila][columna].mina) {
          tablero[fila][columna].adyacentes = -1;
          continue;
        }

        var contador = 0;
        for (var dFila = -1; dFila <= 1; dFila++) {
          for (var dColumna = -1; dColumna <= 1; dColumna++) {
            if (dFila == 0 && dColumna == 0) continue;
            final nFila = fila + dFila;
            final nColumna = columna + dColumna;
            if (_estaDentro(nFila, nColumna) && tablero[nFila][nColumna].mina) {
              contador++;
            }
          }
        }
        tablero[fila][columna].adyacentes = contador;
      }
    }
  }

  /// Verifica si las coordenadas (fila, columna) están dentro de los límites del tablero.
  bool _estaDentro(int fila, int columna) {
    return fila >= 0 && fila < filas && columna >= 0 && columna < columnas;
  }

  /// Descubre la celda en las coordenadas (fila, columna). Si es la primera jugada, coloca las minas.
  bool descubrirCelda(int fila, int columna) {
    if (juegoTerminado) return false;
    if (!_estaDentro(fila, columna)) return false;

    if (!_minasColocadas) {
      _colocarMinas(fila, columna);
      _calcularAdyacentes();
      _minasColocadas = true;
    }

    final celda = tablero[fila][columna];
    if (celda.estaDescubierta || celda.estaMarcada) return false;

    celda.estado = EstadoCelda.descubierto;
    if (celda.mina) {
      perdio = true;
      juegoTerminado = true;
      return true;
    }

    if (celda.adyacentes == 0) {
      _descubrirVecinos(fila, columna);
    }

    gano = _verificarVictoria();
    if (gano) {
      juegoTerminado = true;
    }
    return true;
  }

  /// Descubre recursivamente las celdas vecinas si la celda actual no tiene minas adyacentes.
  void _descubrirVecinos(int fila, int columna) {
    for (var dFila = -1; dFila <= 1; dFila++) {
      for (var dColumna = -1; dColumna <= 1; dColumna++) {
        if (dFila == 0 && dColumna == 0) continue;
        final nFila = fila + dFila;
        final nColumna = columna + dColumna;
        if (!_estaDentro(nFila, nColumna)) continue;

        final vecino = tablero[nFila][nColumna];
        if (vecino.estaDescubierta || vecino.estaMarcada) continue;

        vecino.estado = EstadoCelda.descubierto;
        if (vecino.adyacentes == 0 && !vecino.mina) {
          _descubrirVecinos(nFila, nColumna);
        }
      }
    }
  }

  /// Alterna la bandera en la celda especificada. Si la celda está descubierta, no se puede marcar.
  bool alternarBandera(int fila, int columna) {
    if (juegoTerminado) return false;
    if (!_estaDentro(fila, columna)) return false;

    final celda = tablero[fila][columna];
    if (celda.estaDescubierta) return false;

    celda.estado = celda.estaMarcada ? EstadoCelda.oculto : EstadoCelda.bandera;
    return true;
  }

  /// Verifica si el jugador ha ganado el juego al descubrir todas las celdas sin minas.
  bool _verificarVictoria() {
    for (var fila = 0; fila < filas; fila++) {
      for (var columna = 0; columna < columnas; columna++) {
        final celda = tablero[fila][columna];
        if (!celda.mina && !celda.estaDescubierta) {
          return false;
        }
      }
    }
    return true;
  }

  /// Obtiene la celda en las coordenadas (fila, columna).
  CeldaBuscaminas obtenerCelda(int fila, int columna) {
    return tablero[fila][columna];
  }

  /// Obtiene los estados de todas las celdas del tablero.
  List<List<EstadoCelda>> obtenerEstados() {
    return tablero.map((fila) => fila.map((celda) => celda.estado).toList()).toList();
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    for (var fila = 0; fila < filas; fila++) {
      for (var columna = 0; columna < columnas; columna++) {
        final celda = tablero[fila][columna];
        if (celda.estaMarcada) {
          buffer.write('F ');
        } else if (!celda.estaDescubierta) {
          buffer.write('- ');
        } else if (celda.mina) {
          buffer.write('M ');
        } else {
          buffer.write('${celda.adyacentes} ');
        }
      }
      buffer.writeln();
    }
    return buffer.toString();
  }
}