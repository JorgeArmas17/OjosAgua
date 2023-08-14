import 'package:flutter/material.dart';
import 'package:lays/pages/QR_page.dart';

import '../components/my_textfield.dart';
import '../components/my_button.dart';
import '../components/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {}

  void wrongEmailMesagge() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Correo Incorrecto'),
        );
      },
    );
  }

  void wrongPasswordMesagge() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('COntraseñá Incorrecta'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(height: 50),
            //logo
            const Icon(
              Icons.volcano_outlined,
              size: 100,
            ),

            const SizedBox(height: 50),
            //welcome back, you've been mised
            Text(
              'Bienvenido!!',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            //username textfield
            MyTextField(
              controller: userNameController,
              hintText: 'Correo',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            //password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Contraseñá',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            //forgot password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Olvidaste Contraseña?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            //sign in button
            MyButton(text: "Iniciar Sesión", onTap: signUserIn),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                // Aquí llamaremos a la segunda página al presionar el botón
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary:
                    Colors.black, // Color del botón cuando no está presionado
                onPrimary:
                    Colors.white, // Color del texto cuando no está presionado
                elevation: 5, // Sombra del botón
              ),
              child: const Center(
                child: Text(
                  "Inicia Sesion con QR",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No tienes cuenta?'),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Registrate',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )

            //not a member? register now
          ]),
        ),
      ),
    );
  }
}
