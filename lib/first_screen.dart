import 'package:flutter/material.dart';

//Importación IonIcons
import 'package:ionicons/ionicons.dart';

//PRIMERA PANTALLA: ionicons

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.switchToSecondScreen, {super.key});

  final void Function() switchToSecondScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/numero-1.png", width: 250),

          const SizedBox(height: 30),

          //############ WIDGET ############

          const IconButton(
            onPressed: null,
            icon: Icon(
              Ionicons.happy,
              color: Colors.white,
              size: 80,
            ),
          ),

          //############ WIDGET ############

          const SizedBox(height: 30),

          const Text(
            'Icon Button con Ionicons',
            style: TextStyle(
              color: Color.fromARGB(255, 237, 223, 252),
              fontSize: 30,
            ),
          ),

          const SizedBox(height: 30),

          //Botón de desplazamiento entre pantallas

          OutlinedButton.icon(
            onPressed: switchToSecondScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_circle_right_rounded),
            label: const Text('Segunda Pantalla'),
          ),
        ],
      ),
    );
  }
}
