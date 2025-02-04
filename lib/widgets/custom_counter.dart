import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/counter_view_model.dart';

class CustomCounter extends StatelessWidget{

  Widget build(BuildContext context) {
    final counterViewModel = context.watch<CounterViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: counterViewModel.decrementer,
        ),
        Text(
          '${counterViewModel.getCompteur()}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Icon(
          Icons.favorite,
          color: counterViewModel.getCompteur() < 0 ? Colors.black : Colors.red,
          size: 50,
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: counterViewModel.incrementer,
        ),
      ],
    );
  }
}