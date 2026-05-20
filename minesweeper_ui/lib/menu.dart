import 'package:flutter/material.dart';
import 'package:minesweeper_ui/config.dart';
import 'package:minesweeper_ui/partidaez.dart';
import 'package:minesweeper_ui/tut.dart';
import 'estilo.dart';

class PantallaMenu extends StatelessWidget {
  const PantallaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(width: double.infinity, height: double.infinity,
          decoration: const BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/images/fondo.png'), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //JUGAR
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaPartidaEz()));
              },
                style: ButtonStyle(foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.hovered)) {
                    return ColorsPalette.hoverText;
                  }
                  return ColorsPalette.normalText;
                })),
                child: Text("Jugar", style: TextStyle(fontSize: 96))),
              
              //HIGHSCORE
              TextButton(onPressed: () {},
                style: ButtonStyle(foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.hovered)) {
                    return ColorsPalette.hoverText;
                  }
                  return ColorsPalette.normalText;
                })),
                child: Text("High Scores", style: TextStyle(fontSize: 96))),
              
              //CONFIGURACIONES
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaConfig()));
              },
                style: ButtonStyle(foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.hovered)) {
                    return ColorsPalette.hoverText;
                  }
                  return ColorsPalette.normalText;
                })),
                child: Text("Configuraciones", style: TextStyle(fontSize: 96))),
              
              //TUTORIAL
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaTut()));
              },
                style: ButtonStyle(foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.hovered)) {
                    return ColorsPalette.hoverText;
                  }
                  return ColorsPalette.normalText;
                })),
                child: Text("Tutorial", style: TextStyle(fontSize: 96))),
            ],
          ),
        ),
      )
    );
  }
}