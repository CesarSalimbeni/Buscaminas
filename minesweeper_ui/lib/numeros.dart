import 'package:flutter/material.dart';
import 'estilo.dart';

class PantallaNumeros extends StatelessWidget {
   PantallaNumeros({super.key});

   final List <String> nmros =["1", "2", "3", "4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
                      return Container(color: Colors.cyan, margin: EdgeInsets.all(2),
                      child: Center(
                        child: Text(nmros[index], 
                        style: TextStyle(color: ColorsPalette.normalText, fontSize: 50),
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
                      return Container(color: Colors.cyan, margin: EdgeInsets.all(2),
                      child: Center(
                        child: Text(nmros[index], 
                          style: TextStyle(color: ColorsPalette.normalText, fontSize: 50),
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
                      return Container(color: Colors.cyan, margin: EdgeInsets.all(2),
                      child: Center(
                        child: Text(nmros[index], 
                          style: TextStyle(color: ColorsPalette.normalText, fontSize: 50),
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
                      return Container(color: Colors.cyan, margin: EdgeInsets.all(2),
                      child: Center(
                        child: Text(nmros[index], 
                          style: TextStyle(color: ColorsPalette.normalText, fontSize: 50),
                          ),
                      ),); }),)
                  ],))
              ],
            )
          ],
        ),
      ),
    );
  }
}