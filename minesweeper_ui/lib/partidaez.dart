import 'package:flutter/material.dart';

class PantallaPartidaEz extends StatefulWidget {
  const PantallaPartidaEz({super.key});

  @override
  State<PantallaPartidaEz> createState() => _PantallaPartidaEzState();
}

class _PantallaPartidaEzState extends State<PantallaPartidaEz>{
  List<bool> celdasConBandera = List.generate(36, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF464549),
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(width: 800, height: 800,
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
          itemCount: 36, itemBuilder: (context, index) {
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