import 'package:flutter/material.dart';
import 'estilo.dart';

class PantallaPartidaEz extends StatelessWidget {
  const PantallaPartidaEz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(width: 800, height: 800,
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
          itemCount: 36, itemBuilder: (context, index) {
            return Container(color: Colors.cyan, margin: EdgeInsets.all(2));
          }),
        )
        ),
        ),
      );
    }
}
