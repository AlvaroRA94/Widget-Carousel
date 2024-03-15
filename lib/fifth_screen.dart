import 'package:flutter/material.dart';

//Importación Async adicional
import 'dart:async';

//Importación All Sensors
import 'package:all_sensors/all_sensors.dart';

//QUINTA PANTALLA: Proximity Sensor

class FifthScreen extends StatefulWidget {
  const FifthScreen(this.switchToFourthScreen, {super.key});

  final VoidCallback switchToFourthScreen;

  @override
  State<FifthScreen> createState() {
    return _FifthScreen();
  }
}

class _FifthScreen extends State<FifthScreen> {
  bool _proximityValues = false;
  final List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/numero-5.png", width: 250),
          const SizedBox(height: 30),

          //############ WIDGET ############

          Text(
            'Proximity: $_proximityValues',
            style: const TextStyle(fontSize: 40, color: Colors.white),
          ),

          const SizedBox(height: 30),

          //############ WIDGET ############

          const Text(
            'Quinta Pantalla',
            style: TextStyle(
              color: Color.fromARGB(255, 237, 223, 252),
              fontSize: 20,
            ),
          ),

          //Botón de desplazamiento entre pantallas

          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: widget.switchToFourthScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_circle_left_rounded),
            label: const Text('Cuarta Pantalla'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(proximityEvents!.listen((ProximityEvent event) {
      setState(() {
        //_proximityValues = event.getValue();
        _proximityValues = true;
      });
    }));
  }
}
