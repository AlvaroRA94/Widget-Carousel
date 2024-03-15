import 'dart:math';
import 'package:flutter/material.dart';

//Importación Circular Text
import 'package:flutter_circular_text/circular_text.dart';

//Importación IonIcons
import 'package:ionicons/ionicons.dart';

//CUARTA PANTALLA: Circular Text Widget + Random

class FourthScreen extends StatefulWidget {
  const FourthScreen(this.switchToThirdScreen, this.switchToFifthScreen, {super.key});

  final VoidCallback switchToThirdScreen;
  final VoidCallback switchToFifthScreen;

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  final rng = Random();
  int _numeroAleatorio = 0;

  @override
  void initState() {
    super.initState();
    _numeroAleatorio = generarNumeroAleatorio();
  }

  int generarNumeroAleatorio() {
    return rng.nextInt(91);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/numero-4.png", width: 250),
          const SizedBox(height: 30),
          CircularText(
            children: [
              TextItem(
                text: Text(
                  "Hola".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                space: _numeroAleatorio.toDouble(),
                startAngle: -90,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise,
              ),
              TextItem(
                text: Text(
                  "Adiós".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                space: _numeroAleatorio.toDouble(),
                startAngle: 90,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.anticlockwise,
              ),
            ],
            radius: 90,
            position: CircularTextPosition.inside,
            backgroundPaint: Paint()
              ..color = const Color.fromARGB(255, 116, 161, 238),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: () {
              setState(
                () {
                  _numeroAleatorio = generarNumeroAleatorio();
                },
              );
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              fixedSize: const Size(250, 70),
              
            ),
            icon: const Icon(
              Ionicons.dice,
              color: Colors.white,
              size: 50,
            ),
            label: const Text('Cambiar Espaciado'),
          ),
          const SizedBox(height: 30),
          const Text(
            'Circular Text + Random',
            style: TextStyle(
              color: Color.fromARGB(255, 237, 223, 252),
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: widget.switchToThirdScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_circle_left_rounded),
            label: const Text('Tercera Pantalla'),
          ),
          OutlinedButton.icon(
            onPressed: widget.switchToFifthScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_circle_right_rounded),
            label: const Text('Quinta Pantalla'),
          ),
        ],
      ),
    );
  }
}

class RandomNumberGenerator {
  final _random = Random();
  int get number => 0 - _random.nextInt(91);
}
