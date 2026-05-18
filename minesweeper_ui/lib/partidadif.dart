import 'package:flutter/material.dart';
import 'estilo.dart';

class PantallaPartidaDif extends StatelessWidget {
  const PantallaPartidaDif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(width: 800, height: 800,
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
          itemCount: 100, itemBuilder: (context, index) {
            return Container(color: Colors.cyan, margin: EdgeInsets.all(2));
          }),
        )
        ),
      )
    );
  }
}