import 'package:consulta_cep/screens/tela_consulta.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca CEP',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(surface: Color.fromARGB(255, 237, 207, 255)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TelaConsulta(),
    );
  }
}
