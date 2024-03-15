import 'package:adv_basics/fifth_screen.dart';
import 'package:adv_basics/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/first_screen.dart';
import 'package:adv_basics/second_screen.dart';
import 'package:adv_basics/fourth_screen.dart';

//FORMATO DE LA APP: COLOR DE FONDO Y LÓGICA DE LAS PANTALLAS

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() {
    return _InicioState();
  }
}

class _InicioState extends State<Inicio> {
  var activeScreen = 'first-screen';

  void switchToSecondScreen() {
    setState(() {
      activeScreen = 'second-screen';
    });
  }

  void switchToFirstScreen() {
    setState(() {
      activeScreen = 'first-screen';
    });
  }

  void switchToThirdScreen() {
    setState(() {
      activeScreen = 'third-screen';
    });
  }

    void switchToFourthScreen() {
    setState(() {
      activeScreen = 'fourth-screen';
    });
  }

      void switchToFifthScreen() {
    setState(() {
      activeScreen = 'fifth-screen';
    });
  }



  @override
  Widget build(BuildContext context) {
    Widget screenWidget = FirstScreen(switchToSecondScreen);

    if (activeScreen == 'first-screen') {
      screenWidget = FirstScreen(switchToSecondScreen);
    } else if (activeScreen == 'second-screen') {
      screenWidget = SecondScreen(switchToFirstScreen, switchToThirdScreen);
    } else if (activeScreen == 'third-screen'){
      screenWidget = ThirdScreen(switchToSecondScreen, switchToFourthScreen);
    }else if (activeScreen == 'fourth-screen'){
      screenWidget = FourthScreen(switchToThirdScreen, switchToFifthScreen);
    }else if (activeScreen == 'fifth-screen'){
      screenWidget = FifthScreen(switchToFourthScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 28, 5, 241),
                Color.fromARGB(255, 16, 12, 68),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
