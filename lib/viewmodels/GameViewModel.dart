import 'package:counter_app/models/CaseModel.dart';
import 'package:flutter/material.dart';
import '../models/MapModel.dart';

class GameViewModel extends ChangeNotifier{
  MapModel mapgame = MapModel();

  void generateMap(){
    mapgame.generateMap();
    notifyListeners();
  }

  void click(int l, int c){
    if (!mapgame.getHasFlag(l, c)) {
      mapgame.reveal(l, c);
      if (mapgame.getIsBomb(l, c)){
        mapgame.explode(l, c);
        mapgame.revealAll();
      }
    }
    notifyListeners();

  }

  void onLongPress(int l, int c){
    mapgame.toggleFlag(l, c);
    notifyListeners();
  }

  Image getIcon(int line, int col){
    CaseModel? casen = mapgame.tryGetCase(line, col);
    int? nombre;
    double taille = 60;
    if (casen != null) {
      if (casen.hasFlag) {
        return Image.asset('assets/flag.png', height: taille, width: taille,);
      } else if (casen.hidden){
        return Image.asset('assets/hidden.png', height: taille, width: taille,);
      }
      if (casen.hasExploded) {
        return Image.asset('assets/bombe_explode.jpg', height: taille, width: taille,);
      }
      if (casen.hasBomb) {
        return Image.asset('assets/bombe.jpg', height: taille, width: taille,);
      }
      nombre = casen.number != null ? casen.number : 0;
    } else{
      nombre = 0;
    }
    // si explose sinon flag sinon bombe sinon nombre
    switch(nombre){
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
        return Image.asset('assets/$nombre.jpg', height: taille, width: taille,);
      default:
        return Image.asset('assets/0.jpg', height: taille, width: taille,);
    }


  }

  int getLines() => mapgame.getLines();
  int getCol() => mapgame.getCol();
}