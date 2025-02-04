import 'package:flutter/foundation.dart';
import '../models/counter_model.dart';

class CounterViewModel extends ChangeNotifier{
  CounterModel compteur = CounterModel();


  void incrementer(){
    compteur.incrementCounter();
    notifyListeners();
  }

  void decrementer(){
    compteur.decrementCounter();
    notifyListeners();
  }

  int getCompteur(){
    return compteur.getCounter();
  }
}

