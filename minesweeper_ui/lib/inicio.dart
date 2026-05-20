import 'package:flutter/material.dart';
import 'package:minesweeper_ui/menu.dart';
import 'estilo.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                    textAlign: TextAlign.center,
                    //TITULO
                      TextSpan(
                      text: "Buscaminas Flutter",
                      style: TextStyle(color: ColorsPalette.normalText, fontSize: 128),
                      )
                    ),
                    //BOTON CONTINUAR
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaMenu()));
                    },
                      style:  ButtonStyle(),
                      child: Text.rich(
                       TextSpan(text: "Continuar"), 
                        style: TextStyle(color: ColorsPalette.normalText, fontSize: 48),
                      ) 
                    ),
                  ],
                ),
                Positioned(bottom: 10, child: Align( alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/velitas.png')),),
              ],
            ),
          ),
        ),
    );
  }
}