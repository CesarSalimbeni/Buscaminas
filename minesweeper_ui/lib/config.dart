import 'package:flutter/material.dart';
import 'package:minesweeper_ui/numeros.dart';
import 'estilo.dart';

enum Dificultad { facil, medio, dificil }
enum Nmros { clasico, colorido, retro, minimalista }
enum Tema { claro, oscuro, automatico }

class PantallaConfig extends StatefulWidget {
  final Dificultad initialDifficulty;
  const PantallaConfig({super.key, required this.initialDifficulty});

  @override
  State<PantallaConfig> createState() => _PantallaConfigState();
}

class _PantallaConfigState extends State<PantallaConfig> {
  late Dificultad _selectedDificultad;
  Nmros _selectedNmros = Nmros.clasico;
  Tema _selectedTema = Tema.claro;

  @override
  void initState() {
    super.initState();
    _selectedDificultad = widget.initialDifficulty;
  }

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
                      Navigator.pop(context, _selectedDificultad);
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
                  //DIFICULTAD
                  Column(
                    children: [
                      Text("DIFICULTAD",
                        style: TextStyle(color: ColorsPalette.normalText, fontSize: 60)),
                      SegmentedButton<Dificultad>(segments: [
                        ButtonSegment(value: Dificultad.facil, label: Text("Fácil: 6x6", style: TextStyle(fontSize: 24))),
                        ButtonSegment(value: Dificultad.medio, label: Text("Medio: 8x8", style: TextStyle(fontSize: 24))),
                        ButtonSegment(value: Dificultad.dificil, label: Text("Difícil: 10x10", style: TextStyle(fontSize: 24))),
                        ], selected: {_selectedDificultad},
                        onSelectionChanged: (selection) {
                        setState(() => _selectedDificultad = selection.first);
                        }, style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(ColorsPalette.normalText),
                        side: WidgetStateProperty.all<BorderSide>(
                        BorderSide(
                        color: Color(0xFF565042), 
                        width: 1.0, 
                        ),
                       ),
                        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(WidgetState.selected)) {
                          return  Color(0xFF565042); 
                        }
                        return Colors.transparent; 
                        }), visualDensity: VisualDensity.comfortable,
                        padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 24),),
                      )
                  )]
                  ),
                  const SizedBox(height: 30,),
                      
                  //NUMEROS
                  Column(
                    children: [
                      TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaNumeros()));
                    },
                    style: ButtonStyle(foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.hovered)) {
                    return ColorsPalette.hoverText;
                    }
                    return ColorsPalette.normalText;
                })),
                child: Text("NÚMEROS", style: TextStyle(fontSize: 60))),
                      SegmentedButton<Nmros>(segments: [
                        ButtonSegment(value: Nmros.clasico, label: Text("Clásico", style: TextStyle(fontSize: 24))),
                        ButtonSegment(value: Nmros.colorido, label: Text("Colorido", style: TextStyle(fontSize: 24))),
                        ButtonSegment(value: Nmros.minimalista, label: Text("Minimalista", style: TextStyle(fontSize: 24))),
                        ButtonSegment(value: Nmros.retro, label: Text("Retro", style: TextStyle(fontSize: 24)))
                        ], selected: {_selectedNmros},
                        onSelectionChanged: (selection) {
                        setState(() => _selectedNmros = selection.first);
                        }, style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(ColorsPalette.normalText),
                        side: WidgetStateProperty.all<BorderSide>(
                        BorderSide(
                        color: Color(0xFF565042), 
                        width: 1.0, 
                        ),
                       ),
                        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(WidgetState.selected)) {
                          return  Color(0xFF565042); 
                        }
                        return Colors.transparent; 
                        }), visualDensity: VisualDensity.comfortable,
                        padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 24),),
                      )
                  )]
                  ),
                  const SizedBox(height: 30,),
                  
                  //EFECTOS ESPECIALES
                  Column(
                    children: [
                      Text("EFECTOS ESPECIALES",
                    style: TextStyle(color: ColorsPalette.normalText, fontSize: 60)),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Sonidos",
                          style: TextStyle(color: ColorsPalette.normalText, fontSize: 40)),
                        Text("Animaciones",
                          style: TextStyle(color: ColorsPalette.normalText, fontSize: 40))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                      
                  //TEMA
                  Column(
                    children: [
                      Text("TEMA",
                        style: TextStyle(color: ColorsPalette.normalText, fontSize: 60)),
                      SegmentedButton<Tema>(segments: [
                        ButtonSegment(value: Tema.claro, label: Text("Claro", style: TextStyle(fontSize: 24))),
                        ButtonSegment(value: Tema.oscuro, label: Text("Oscuro", style: TextStyle(fontSize: 24))),
                        ButtonSegment(value: Tema.automatico, label: Text("Automático", style: TextStyle(fontSize: 24))),
                        ], selected: {_selectedTema},
                        onSelectionChanged: (selection) {
                        setState(() => _selectedTema = selection.first);
                        }, style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(ColorsPalette.normalText),
                        side: WidgetStateProperty.all<BorderSide>(
                        BorderSide(
                        color: Color(0xFF565042), 
                        width: 1.0, 
                        ),
                       ),
                        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(WidgetState.selected)) {
                          return  Color(0xFF565042); 
                        }
                        return Colors.transparent; 
                        }), visualDensity: VisualDensity.comfortable,
                        padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 24),),
                      )
                  )]
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}