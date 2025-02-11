
import 'package:counter_app/viewmodels/GameViewModel.dart';
import 'package:counter_app/widgets/MapButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameView extends StatelessWidget{
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    //final gameViewModel = context.watch<GameViewModel>();
    List<List<int>> ail = [[0,1,2], [3,4,5], [6,7,8]];
    final ail2 = GameViewModel();
    //final ail2 = context.watch()<GameViewModel>();
    return Scaffold(
      body: Center(
        child: Column(
            children: List.generate(ail2.getCol(), (index) => Row(
              children: List.generate(ail2.getLines(), (index) => MapButton()),
            )),
        ),
      ),
    );
  }
}