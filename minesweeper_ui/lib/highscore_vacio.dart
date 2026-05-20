import 'package:flutter/material.dart';
import 'package:minesweeper_ui/menu.dart';
import 'estilo.dart';

class PantallaHsvacio extends StatelessWidget {
  const PantallaHsvacio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity, height: double.infinity,
          decoration: const BoxDecoration(image: DecorationImage(
          image: AssetImage('assets/images/fondo.png'), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Aún no tienes registros. ¡Juega tu primera partida!", textAlign: TextAlign.center,
                style: TextStyle(color: ColorsPalette.normalText, fontSize: 100),),
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaMenu()));
              },
               child: Text("Regresar a menu",
                  style: TextStyle(color: ColorsPalette.normalText, fontSize: 80)))
            ],
          ),
        ),
      )
    );
  }
}