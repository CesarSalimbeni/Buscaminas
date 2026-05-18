import 'package:flutter/material.dart';
import 'estilo.dart';

class PantallaTut extends StatelessWidget {
  const PantallaTut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Tutorial", 
            style: TextStyle(color: ColorsPalette.normalText, fontSize: 100),),
            Text("- Haz click en una casilla para revelarla",
            style: TextStyle(color: ColorsPalette.normalText, fontSize: 64),),
            Text("- Los números indican la cantidad de minas", textAlign: TextAlign.center,
            style: TextStyle(color: ColorsPalette.normalText, fontSize: 64),),
            Text("- No hagas click en las casillas con minas", textAlign: TextAlign.center,
            style: TextStyle(color: ColorsPalette.normalText, fontSize: 64),)
          ],
        ),
      )
    );
  }
}