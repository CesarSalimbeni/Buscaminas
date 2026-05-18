import 'package:flutter/material.dart';
import 'estilo.dart';

class PantallaConfig extends StatelessWidget {
  const PantallaConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //DIFICULTAD
            Column(
              children: [
                Text("DIFICULTAD",
                  style: TextStyle(color: ColorsPalette.normalText, fontSize: 64)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Fácil: 6x6",
                      style: TextStyle(color: ColorsPalette.normalText, fontSize: 40)),
                    Text("Medio: 8x8",
                      style: TextStyle(color: ColorsPalette.normalText, fontSize: 40)),
                    Text("Difícil: 10x10",
                      style: TextStyle(color: ColorsPalette.normalText, fontSize: 40))
                  ],
                ),
              ]
            ),
            const SizedBox(height: 50,),

            //NUMEROS
            Column(
              children: [
                TextButton(onPressed: () {},
                 child: Text("NÚMEROS",
                  style: TextStyle(color: ColorsPalette.normalText, fontSize: 64)),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Clásico",
                      style: TextStyle(color: ColorsPalette.normalText, fontSize: 40)),
                    Text("Colorido",
                      style: TextStyle(color: ColorsPalette.normalText, fontSize: 40)),
                    Text("Minimalista",
                      style: TextStyle(color: ColorsPalette.normalText, fontSize: 40)),
                    Text("Retro",
                      style: TextStyle(color: ColorsPalette.normalText, fontSize: 40))
                  ],
                ),
              ]
            ),
            const SizedBox(height: 50,),
            
            //EFECTOS ESPECIALES
            Column(
              children: [
                Text("EFECTOS ESPECIALES",
              style: TextStyle(color: ColorsPalette.normalText, fontSize: 64)),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Sonidos",
                    style: TextStyle(color: ColorsPalette.normalText, fontSize: 40)),
                  Text("Animaciones",
                    style: TextStyle(color: ColorsPalette.normalText, fontSize: 40))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50,),

            //TEMA
            Column(
              children: [
                Text("TEMA",
                  style: TextStyle(color: ColorsPalette.normalText, fontSize: 64)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text("Claro",
                    style: TextStyle(color: ColorsPalette.normalText, fontSize: 40)),
                  Text("Oscuro",
                    style: TextStyle(color: ColorsPalette.normalText, fontSize: 40)),
                  Text("Automático",
                    style: TextStyle(color: ColorsPalette.normalText, fontSize: 40))
                  ],
                ),
              ]
            ),
          ],
        ),
      )
    );
  }
}