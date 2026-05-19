import 'package:flutter/material.dart';

class PantallaPartidaMed extends StatelessWidget {
  const PantallaPartidaMed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF464549),
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(width: 800, height: 800,
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
          itemCount: 64, itemBuilder: (context, index) {
            return Container(margin: EdgeInsets.all(2), decoration: const BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/images/bloque.jpg'), fit: BoxFit.cover)));
          }),
        )
        ),
      )
    );
  }
}