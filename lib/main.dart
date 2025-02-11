import 'package:flutter/material.dart';
import 'views/GameView.dart';

void main() {
  runApp(const AppDemineur());
}


class AppDemineur extends StatelessWidget{
  const AppDemineur({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Deminaue',
      initialRoute: '/',
      routes: {
        '/': (context) => GameView(),
//'/second': (context) => const SecondPage(),
      },
    );
  }
}
