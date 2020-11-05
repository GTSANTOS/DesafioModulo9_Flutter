import 'package:desafio_modulo9/app/pages/detalhes_page.dart';
import 'package:desafio_modulo9/app/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (_) => HomePage(),
        '/detalhes': (_) => Detalhes(),
      },
    );
  }
}
