import 'package:flutter/material.dart';
import 'package:minesweeper_ui/menu.dart';
import 'estilo.dart';

class PantallaTut extends StatelessWidget {
  const PantallaTut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity, height: double.infinity,
          decoration: const BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/images/fondo.png'), fit: BoxFit.cover)),
        child: Center(
          child: Stack(
            children: [
                Column(
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
                  Text("TUTORIAL", 
                  style: TextStyle(color: ColorsPalette.normalText, fontSize: 60),),
                  Text("Descubre todas las casillas,", 
                  textAlign: TextAlign.center, style: TextStyle(color: ColorsPalette.normalText, fontSize: 45),),
                  Text("pero ten precaución con las minas escondidas", 
                  textAlign: TextAlign.center, style: TextStyle(color: ColorsPalette.normalText, fontSize: 45),),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 600,
                      child: Column(
                              children: [
                                Text("Instrucciones", 
                                style: TextStyle(color: ColorsPalette.normalText, fontSize: 40),),
                                Text("- Haz click en una casilla para revelarla", textAlign: TextAlign.center,
                                style: TextStyle(color: ColorsPalette.normalText, fontSize: 30),),
                                Text("- Los números indican la cantidad de minas", textAlign: TextAlign.center,
                                style: TextStyle(color: ColorsPalette.normalText, fontSize: 30),),
                                Text("- No hagas click en las casillas con minas", textAlign: TextAlign.center,
                                style: TextStyle(color: ColorsPalette.normalText, fontSize: 30),),
                                Text("- Revela todas las minas para ganar", textAlign: TextAlign.center,
                                style: TextStyle(color: ColorsPalette.normalText, fontSize: 30),)
                              ],
                        )
                      ),
                      SizedBox(width: 100),
                      SizedBox(width: 600, 
                      child: Column(
                              children: [
                                Text("Dificultad", 
                                style: TextStyle(color: ColorsPalette.normalText, fontSize: 40),),
                                Text("- Fácil: cuadrícula 6x6, 10 minas", textAlign: TextAlign.center,
                                style: TextStyle(color: ColorsPalette.normalText, fontSize: 30),),
                                Text("- Medio: cuadrícula 8x8, 20 minas", textAlign: TextAlign.center,
                                style: TextStyle(color: ColorsPalette.normalText, fontSize: 30),),
                                Text("- Difícil: cuadrícula 10x10, 30 minas (o más)", textAlign: TextAlign.center,
                                style: TextStyle(color: ColorsPalette.normalText, fontSize: 30),)
                              ],
                        )
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
