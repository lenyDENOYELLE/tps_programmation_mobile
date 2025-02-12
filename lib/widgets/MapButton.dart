
import 'package:counter_app/models/CaseModel.dart';
import 'package:counter_app/viewmodels/GameViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class MapButton extends StatelessWidget{
  final int line;
  final int col;
  const MapButton({super.key, required this.line, required this.col});

  @override
  Widget build(BuildContext context){
    final gameViewModel = context.watch<GameViewModel>();
    return InkWell(onTap: () => gameViewModel.click(line, col),
        onLongPress: () => gameViewModel.onLongPress(line, col),
        child: gameViewModel.getIcon(line, col));

      Container(
      width: 32,
      height: 32,
      child: InkWell(
        onTap: () => gameViewModel.click(line, col),
        onLongPress: () => gameViewModel.onLongPress(line, col),
        child: gameViewModel.getIcon(line, col),
      ),
    );


  }

}