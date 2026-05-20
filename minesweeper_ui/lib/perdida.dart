import 'package:flutter/material.dart';
import 'estilo.dart';

class PantallaPerdida extends StatelessWidget {
  const PantallaPerdida({super.key});

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
              Text("¡HAS PERDIDO!",
                style: TextStyle(color: ColorsPalette.normalText, fontSize: 100),
              ),
              TextButton(onPressed: () {},
                style: ButtonStyle(foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.hovered)) {
                  return ColorsPalette.hoverText;
                }
                  return ColorsPalette.normalText;
                })),
                child: Text("Volver a jugar", style: TextStyle(fontSize: 70)))
            ],
          ),
        ),
      )
    );
  }
}