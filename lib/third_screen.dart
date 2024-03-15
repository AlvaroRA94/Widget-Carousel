import 'package:flutter/material.dart';

//Importación Shared Preferences
import 'package:shared_preferences/shared_preferences.dart';

//TERCERA PANTALLA: Shared Preferences

class ThirdScreen extends StatefulWidget {
  const ThirdScreen(this.switchToSecondScreen, this.switchToFourthScreen,
      {super.key});

  final VoidCallback switchToSecondScreen;
  final VoidCallback switchToFourthScreen;

  @override
  State<ThirdScreen> createState() {
    return _ThirdScreenState();
  }
}

class _ThirdScreenState extends State<ThirdScreen> {
  String nombre_1 = "Papá";
  String telefono_1 = "666555333";

  String nombre_2 = "Mamá";
  String telefono_2 = "666222111";

  String nombre_3 = "La Suegra";
  String telefono_3 = "666999000";

  void _initState() {
    super.initState();
    _cargarTelefonos();
  }

  void _cargarTelefonos() async {
    SharedPreferences shPrefs = await SharedPreferences.getInstance();
    setState(() {
      nombre_1 = shPrefs.getString("nombre_1") ?? "";
      telefono_1 = shPrefs.getString("telefono_1") ?? "";

      nombre_2 = shPrefs.getString("nombre_2") ?? "";
      telefono_2 = shPrefs.getString("telefono_2") ?? "";

      nombre_3 = shPrefs.getString("nombre_3") ?? "";
      telefono_3 = shPrefs.getString("telefono_3") ?? "";
    });
  }

  void _guardarTelefonos() async {
    SharedPreferences shPrefs = await SharedPreferences.getInstance();

    shPrefs.setString("nombre_1", "Telepizza");
    shPrefs.setString("telefono_1", "666111222");

    shPrefs.setString("nombre_2", "Thermomix Wallapop");
    shPrefs.setString("telefono_2", "666222111");

    shPrefs.setString("nombre_3", "Pepe Cuñao");
    shPrefs.setString("telefono_3", "666888777");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/numero-3.png", width: 250),
          const SizedBox(height: 15),

          // TEXTOS DE PERSONAS Y TLFS:
          
          // Persona 1
          const Text(
            "Persona 1:",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            nombre_1,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
          Text(
            telefono_1,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),

          // Persona 2
          const Text(
            "Persona 2:",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            nombre_2,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
          Text(
            telefono_2,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),

          // Persona 3
          const Text(
            "Persona 3:",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            nombre_3,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
          Text(
            telefono_3,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),

          const SizedBox(height: 15),

          // BOTONES PARA GUARDAR Y CARGAR LOS DATOS
          ElevatedButton(
            onPressed: _cargarTelefonos,
            child: const Text("Cargar datos Shared Preferences"),
          ),
          ElevatedButton(
            onPressed: _guardarTelefonos,
            child: const Text("Guardar datos Shared Preferences"),
          ),
          const SizedBox(height: 15),
          const Text(
            'Shared Preferences',
            style: TextStyle(
              color: Color.fromARGB(255, 223, 231, 252),
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 15),
          OutlinedButton.icon(
            onPressed: widget.switchToSecondScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_circle_left_rounded),
            label: const Text('Segunda Pantalla'),
          ),
          OutlinedButton.icon(
            onPressed: widget.switchToFourthScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_circle_right_rounded),
            label: const Text('Cuarta Pantalla'),
          ),
        ],
      ),
    );
  }
}
