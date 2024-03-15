import 'package:flutter/material.dart';

//Importación Wheel Slider
import 'package:wheel_slider/wheel_slider.dart';

//SEGUNDA PANTALLA: Wheel Slider + flutter vibrate

class SecondScreen extends StatefulWidget {
  const SecondScreen(this.switchToFirstScreen, this.switchToThirdScreen,{super.key});

  final VoidCallback switchToFirstScreen;
  final VoidCallback switchToThirdScreen;

  @override
  State<SecondScreen> createState() {
    return _SecondScreenState();
    }
}

class _SecondScreenState extends State<SecondScreen> {

  //Variables de la Wheel Slider
  final int _nTotalCount = 10;
  final int _nInitValue = 0;
  int _nCurrentValue = 0;

  //Variable de la imagen
  double _imageSize = 10; 

  @override
  Widget build(BuildContext context) {
    _updateImageSize();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/numero-2.png", width: _imageSize),
          const SizedBox(height: 30),
          WheelSlider.number(
            horizontal: true,
            verticalListHeight: 500.0,
            perspective: 0.01,
            totalCount: _nTotalCount,
            initValue: _nInitValue,
            unSelectedNumberStyle: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
            selectedNumberStyle: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            currentIndex: _nCurrentValue,
            onValueChanged: (val) {
              setState(() {
                _nCurrentValue = val;
              });
            },
            hapticFeedbackType: HapticFeedbackType.heavyImpact,
          ),
          const SizedBox(height: 30),
          const Text(
            'Wheel Slider + flutter vibrate',
            style: TextStyle(
              color: Color.fromARGB(255, 237, 223, 252),
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: widget.switchToFirstScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_circle_left_rounded),
            label: const Text('Primera Pantalla'),
          ),
          OutlinedButton.icon(
            onPressed: widget.switchToThirdScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_circle_right_rounded),
            label: const Text('Tercera Pantalla'),
          ),
        ],
      ),
    );
  }

//Lógica que compara el valor del WheelSlider con el tamaño de la img
  void _updateImageSize() {
    if (_nCurrentValue == 0) {
      _imageSize = 150.0;
    } else if (_nCurrentValue == 2) {
      _imageSize = 200.0;
    } else if (_nCurrentValue == 4) {
      _imageSize = 250.0;
    } else if (_nCurrentValue == 6) {
      _imageSize = 300.0;
    } else if (_nCurrentValue == 8) {
      _imageSize = 350.0;
    } else if (_nCurrentValue == 10) {
      _imageSize = 400.0;
    }
  }
}
