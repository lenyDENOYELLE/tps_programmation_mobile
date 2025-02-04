
class CounterModel {
  int _counter = 0;

  // Méthode d'incrémentation du compteur
  void incrementCounter() {
      _counter++;
  }

  // Méthode de décrémentation du compteur
  void decrementCounter() {
    _counter--;
  }

  int getCounter() {
    return _counter;
  }
}