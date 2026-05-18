import 'package:flutter/material.dart';
import 'estilo.dart';

class PantallaPartidaMed extends StatelessWidget {
  const PantallaPartidaMed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(width: 800, height: 800,
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
          itemCount: 64, itemBuilder: (context, index) {
            return Container(color: Colors.cyan, margin: EdgeInsets.all(2));
          }),
        )
        ),
      )
    );
  }
}