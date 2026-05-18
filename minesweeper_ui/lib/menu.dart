import 'package:flutter/material.dart';
import 'estilo.dart';

class PantallaMenu extends StatelessWidget {
  const PantallaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //JUGAR
            TextButton(onPressed: () {},
             child: Text("Jugar",
                style: TextStyle(color: ColorsPalette.normalText, fontSize: 96))),
            
            //HIGHSCORE
            TextButton(onPressed: () {},
             child: Text("High Scores",
                style: TextStyle(color: ColorsPalette.normalText, fontSize: 96))),
            
            //CONFIGURACIONES
            TextButton(onPressed: () {},
             child: Text("Configuraciones",
                style: TextStyle(color: ColorsPalette.normalText, fontSize: 96))),
            
            //TUTORIAL
            TextButton(onPressed: () {},
             child: Text("Tutorial",
                style: TextStyle(color: ColorsPalette.normalText, fontSize: 96))),
          ],
        ),
      )
    );
  }
}