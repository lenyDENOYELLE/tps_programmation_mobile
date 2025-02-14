
import 'package:counter_app/viewmodels/GameViewModel.dart';
import 'package:counter_app/widgets/MapButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameView extends StatelessWidget{
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    final ail2 = GameViewModel();
    ail2.generateMap();
    //final ail2 = context.watch()<GameViewModel>();

    return Scaffold(
      body: Center(
        child: Table(
          children: List.generate(ail2.getLines(), (line) => TableRow(
            children: List.generate(ail2.getCol(), (col) => 
            ChangeNotifierProvider.value(value: ail2,
            child: MapButton(line: line, col: col),))
          )),
        ),
      ),
    );


    /*
    return Scaffold(
      body: Center(
        child: Row(
            children: List.generate(ail2.getLines(), (line) => Column(
              children: List.generate(ail2.getCol(), (col) =>
                  ChangeNotifierProvider.value(value: ail2,
                      child: MapButton(line: line, col: col)
                  )
              ),
            )),

        ),
      ),
    );*/
  }
}

