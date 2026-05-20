import 'package:flutter/material.dart';

class PantallaPartidaMed extends StatefulWidget {
  const PantallaPartidaMed({super.key});

  @override
  State<PantallaPartidaMed> createState() => _PantallaPartidaMedState();
}

class _PantallaPartidaMedState extends State<PantallaPartidaMed>{
  List<bool> celdasConBandera = List.generate(64, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF464549),
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(width: 800, height: 800,
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
          itemCount: 64, itemBuilder: (context, index) {
            return GestureDetector(onLongPress: () {
              setState(() {
                celdasConBandera[index] = !celdasConBandera[index];
              });
            }, 
            child: Container(margin: EdgeInsets.all(2), decoration: const BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/images/bloque.jpg'), fit: BoxFit.cover)),
              child: celdasConBandera[index]
              ? Padding(padding: EdgeInsets.all(0), child: Image.asset('assets/images/bandera.png'),
              )
              :
              null
              )
              );
          }),
        )
        ),
        ),
      );
    }
}