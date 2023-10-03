import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importa GetX

import 'package:soundfunction/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(key: key); // Corrige la definición del constructor

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Utiliza GetMaterialApp para la navegación de GetX
      debugShowCheckedModeBanner: false,
      home: const Home(),
      title: 'SoundSky',
      theme: ThemeData(
        fontFamily: "regular",
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
    );
  }
}
