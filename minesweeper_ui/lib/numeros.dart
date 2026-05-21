import 'package:flutter/material.dart';
import 'package:minesweeper_ui/config.dart';
import 'estilo.dart';

class PantallaNumeros extends StatelessWidget {
   PantallaNumeros({super.key});

   final List <String> nmros =["1", "2", "3", "4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity, height: double.infinity,
          decoration: const BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/images/fondo.png'), fit: BoxFit.cover)),
        child: Center(
          child: Stack(
            children: [Column(
              children: [
                SizedBox(height: 24),
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.hovered)) {
                    return ColorsPalette.hoverText;
                    }
                    return ColorsPalette.normalText;
                })),
                child: Text("<- Regresar", style: TextStyle(fontSize: 30))),
                  ],
            ),
            SizedBox(height: 40,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Números", 
                    style: TextStyle(color: ColorsPalette.normalText, fontSize: 80),),
                  SizedBox(height: 20),
                      
                      
                  //FILA 1
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 400,
                        child: Column(children: [
                          Text("Clásico",
                              style: TextStyle(color: ColorsPalette.normalText, fontSize: 50),),
                            SizedBox(height: 200, width: 200, 
                              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                itemCount: 4, itemBuilder: (context, index) { 
                            return Container(margin: EdgeInsets.all(2), decoration: const BoxDecoration(image: DecorationImage(
                            image: AssetImage('assets/images/bloque.jpg'), fit: BoxFit.cover)),
                            child: Center(
                              child: Text(nmros[index], 
                                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 50),
                                ),
                            ),);}
                            ),)
                        ],)),
                      
                      SizedBox(width: 400,
                        child: Column(children: [
                          Text("Colorido",
                              style: TextStyle(color: ColorsPalette.normalText, fontSize: 50),),
                            SizedBox(height: 200, width: 200, 
                              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                itemCount: 4, itemBuilder: (context, index) {
                            return Container(margin: EdgeInsets.all(2), decoration: const BoxDecoration(image: DecorationImage(
                            image: AssetImage('assets/images/bloque.jpg'), fit: BoxFit.cover)),
                            child: Center(
                              child: Text(nmros[index], 
                                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 50),
                                ),
                            ),); } ),)
                        ],))
                    ],
                  ),
                      
                      
                  //FILA 2
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 400,
                        child: Column(children: [
                          Text("Minimalista",
                              style: TextStyle(color: ColorsPalette.normalText, fontSize: 50),),
                            SizedBox(height: 200, width: 200, 
                              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                itemCount: 4, itemBuilder: (context, index) { 
                            return Container(margin: EdgeInsets.all(2), decoration: const BoxDecoration(image: DecorationImage(
                            image: AssetImage('assets/images/bloque.jpg'), fit: BoxFit.cover)),
                            child: Center(
                              child: Text(nmros[index], 
                                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 50),
                                ),
                            ),); }),)
                        ],)),
                      
                      SizedBox(width: 400,
                        child: Column(children: [
                          Text("Retro",
                              style: TextStyle(color: ColorsPalette.normalText, fontSize: 50),),
                            SizedBox(height: 200, width: 200, 
                              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                itemCount: 4, itemBuilder: (context, index) {
                            return Container(margin: EdgeInsets.all(2), decoration: const BoxDecoration(image: DecorationImage(
                            image: AssetImage('assets/images/bloque.jpg'), fit: BoxFit.cover)),
                            child: Center(
                              child: Text(nmros[index], 
                                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 50),
                                ),
                            ),); }),)
                        ],))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}