import 'package:flutter/material.dart';

import '../models/MapModel.dart';

class GameViewModel{
  MapModel mapgame = MapModel();

  void generateMap(){
    mapgame.generateMap();
  }

  void click(){

  }

  void onLongPress(){

  }

  Icon getIcon(choix){
    switch(choix){
      case 'flag':
        return Icon(Icons.flag,
                  color: Colors.red,
                  size: 50,
                );
      case 'mine':
        return Icon(Icons.dangerous,
          color: Colors.red,
          size: 50,
        );
      case 'explode':
        return Icon(Icons.stream_rounded,
          color: Colors.orange,
          size: 50,
        );
      case 1:
        return Icon(Icons.numbers,
        color: Colors.blue,
        size: 50,);
        
    }
  }
}