import 'package:flutter/material.dart';

import '../models/MapModel.dart';

class GameViewModel{
  MapModel mapgame = MapModel();

  void generateMap(){
    mapgame.generateMap();
  }

  void click(int l, int c){
    if (!mapgame.getHasFlag(l, c)) {
      mapgame.reveal(l, c);
      if (mapgame.getIsBomb(l, c)){
        mapgame.explode(l, c);
        mapgame.revealAll();
      }
    }

  }

  void onLongPress(int l, int c){
    mapgame.toggleFlag(l, c);
  }

  Image getIcon(choix){

    // si explose sinon flag sinon bombe sinon nombre
    switch(choix){
      case 'flag':
        return Image.asset('assets/flag.png', height: 40,);
      case 'mine':
        return Image.asset('assets/bombe.jpg', height: 40,);
      case 'explode':
        return Image.asset('assets/bombe_explode.jpg', height: 40,);
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
        return Image.asset('assets/$choix.jpg', height: 40);
      default:
        return Image.asset('assets/0.jpg', height: 40);
    }
  }
}