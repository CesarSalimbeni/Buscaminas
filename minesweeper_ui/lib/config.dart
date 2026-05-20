import 'package:flutter/material.dart';
import 'package:minesweeper_ui/menu.dart';
import 'package:minesweeper_ui/numeros.dart';
import 'estilo.dart';

class PantallaConfig extends StatelessWidget {
  const PantallaConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity, height: double.infinity,
          decoration: const BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/images/fondo.png'), fit: BoxFit.cover)),
        child: Center(
          child: Stack(
            children: [Column(
                  children: [
                    SizedBox(height: 24),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaMenu()));
                    },
                    style: ButtonStyle(foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.hovered)) {
                    return ColorsPalette.hoverText;
                    }
                    return ColorsPalette.normalText;
                })),
                child: Text("<- Regresar", style: TextStyle(fontSize: 30))),
                  ],
                ),
                SizedBox(height: 40,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //DIFICULTAD
                  Column(
                    children: [
                      Text("DIFICULTAD",
                        style: TextStyle(color: ColorsPalette.normalText, fontSize: 60)),
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
                  const SizedBox(height: 30,),
                      
                  //NUMEROS
                  Column(
                    children: [
                      TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaMenu()));
                    },
                    style: ButtonStyle(foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.hovered)) {
                    return ColorsPalette.hoverText;
                    }
                    return ColorsPalette.normalText;
                })),
                child: Text("NÚMEROS", style: TextStyle(fontSize: 30))),
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
                  const SizedBox(height: 30,),
                  
                  //EFECTOS ESPECIALES
                  Column(
                    children: [
                      Text("EFECTOS ESPECIALES",
                    style: TextStyle(color: ColorsPalette.normalText, fontSize: 60)),
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
                  const SizedBox(height: 30,),
                      
                  //TEMA
                  Column(
                    children: [
                      Text("TEMA",
                        style: TextStyle(color: ColorsPalette.normalText, fontSize: 60)),
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
            ],
          ),
        ),
      )
    );
  }
}