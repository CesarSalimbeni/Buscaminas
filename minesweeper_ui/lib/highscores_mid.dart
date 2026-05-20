import 'package:flutter/material.dart';
import 'package:minesweeper_ui/highscores_dif.dart';
import 'package:minesweeper_ui/highscores_ez.dart';
import 'package:minesweeper_ui/menu.dart';
import 'estilo.dart';

class PantallaHsMid extends StatelessWidget {
  const PantallaHsMid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, height: double.infinity,
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
                Column( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,),
                    Text("HIGH SCORES", 
                        textAlign: TextAlign.center, style: TextStyle(color: ColorsPalette.normalText, fontSize: 80),),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaHsEz()));
                        },
                        style: ButtonStyle(foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                        if (states.contains(WidgetState.hovered)) {
                          return ColorsPalette.hoverText;
                        }
                          return ColorsPalette.normalText;
                        })),
                        child: Text("FÁCIL", style: TextStyle(fontSize: 60))),
                        
                        Text("MEDIO", 
                        textAlign: TextAlign.center, style: TextStyle(color: ColorsPalette.normalText, fontSize: 60),),
                        
                        TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaHsDif()));
                        },
                        style: ButtonStyle(foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                        if (states.contains(WidgetState.hovered)) {
                          return ColorsPalette.hoverText;
                        }
                          return ColorsPalette.normalText;
                        })),
                        child: Text("DIFÍCIL", style: TextStyle(fontSize: 60)))
                      ],
                    ),
                    Text("Usuario", 
                        textAlign: TextAlign.center, style: TextStyle(color: ColorsPalette.normalText, fontSize: 60),),
                    Text("Usuario", 
                        textAlign: TextAlign.center, style: TextStyle(color: ColorsPalette.normalText, fontSize: 60),),
                    Text("Usuario", 
                        textAlign: TextAlign.center, style: TextStyle(color: ColorsPalette.normalText, fontSize: 60),),
                    Text("Usuario", 
                        textAlign: TextAlign.center, style: TextStyle(color: ColorsPalette.normalText, fontSize: 60),),
                    Text("Usuario", 
                        textAlign: TextAlign.center, style: TextStyle(color: ColorsPalette.normalText, fontSize: 60),)
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}