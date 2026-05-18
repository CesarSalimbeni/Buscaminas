import 'package:flutter/material.dart';
import 'estilo.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
        body: Center(
          child: Column(
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
              TextButton(onPressed: () {},
                style:  ButtonStyle(
                  
                ),
                child: Text.rich(
                 TextSpan(text: "Continuar"), 
                  style: TextStyle(color: ColorsPalette.normalText, fontSize: 48),
                ) 
              ),
            ],
          ),
        ),
    );
  }
}