import 'package:flutter/material.dart';
import 'package:minesweeper_ui/buscaminas.dart';
import 'package:minesweeper_ui/estilo.dart';

class PantallaPartidaDif extends StatefulWidget {
  const PantallaPartidaDif({super.key});

  @override
  State<PantallaPartidaDif> createState() => _PantallaPartidaDifState();
}

class _PantallaPartidaDifState extends State<PantallaPartidaDif>{
  late Buscaminas _juego;
  final int _filas = 6;
  final int _columnas = 6;
  final int _minas = 10;

  @override
  void initState(){
    super.initState();
    _juego = Buscaminas(filas: _filas, columnas: _columnas, minas: _minas);
  }

  void _reiniciarPartida(){
    setState(() {
      _juego.reiniciar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF464549),
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(width: 800, height: 800,
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _columnas),
          itemCount: _filas*_columnas, itemBuilder: (context, index) {
            int fila = index ~/ _columnas;
            int columna = index % _columnas;
            CeldaBuscaminas celda = _juego.obtenerCelda(fila, columna);

            return GestureDetector(onTap: (){
              setState(() {
                _juego.descubrirCelda(fila, columna);
                if(_juego.juegoTerminado){
                  //cambio a pantalla de victoria o perdida
                }
              },); },
              onLongPress: () {
                setState((){
                  _juego.alternarBandera(fila, columna);
                });
              },
              child: _vistaCelda(celda)
            );
          }
        )
        ),
        ),
      ));
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
              child: Text('${celda.adyacentes}', style: EstilosBuscaminas.numero(celda.adyacentes),)
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
