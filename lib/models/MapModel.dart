import 'dart:math';

import './CaseModel.dart';
class MapModel { //
  int nbLine = 9;
  int nbCol = 9;
  int nbBomb = 10;
  List<List<CaseModel>> _cases = List<List<CaseModel>>.empty();

  void initCases(){
    _cases =
    List<List<CaseModel>>.generate(nbLine, (int index) =>
        List<CaseModel>.generate(nbCol, (int index) => CaseModel() , growable: false),
        growable: false
    );
  }

  void initBomb(){
    int l;
    int c;
    int bombePlacees = 0;
    while (bombePlacees < nbBomb){
      l = Random().nextInt(nbLine);
      c = Random().nextInt(nbCol);
      if (!_cases[l][c].hasBomb){
        _cases[l][c].hasBomb = true;
        bombePlacees++;
      }
    }
  }

  CaseModel? tryGetCase(int l, int c){
    if (c < 0 || c >= nbCol || l < 0 || l >= nbLine){
      return null;
    }
    return _cases[l][c];
  }

  int computeNumber(int l, int c){
    List<CaseModel?> voisins = [tryGetCase(l-1, c-1), tryGetCase(l-1, c), tryGetCase(l-1, c+1),
                                tryGetCase(l, c-1), tryGetCase(l, c+1),
                                tryGetCase(l+1, c-1), tryGetCase(l+1, c), tryGetCase(l+1, c+1)];
    int compteur = 0;
    for (CaseModel? casev in voisins){
      if (casev != null){
        if (casev.hasBomb){
          compteur++;
        }
      }
    }
    return compteur;
  }

  void initNumbers(){
    for (int line = 0; line < nbLine ; line++){
      for (int col = 0; col < nbCol ; col++){
        if (!_cases[line][col].hasBomb){
          _cases[line][col].setNbBomb(computeNumber(line, col));
        }
      }
    }
  }

  void generateMap(){
    initCases();
    initBomb();
    initNumbers();
  }

  void reveal(int l, int c){
    CaseModel? casee = tryGetCase(l, c);
    if (casee != null) {
      if (!casee.hasFlag && casee.hidden) {
        casee.hidden = false;
        if (casee.number != null && casee.number == 0) {
          reveal(l - 1, c - 1);
          reveal(l - 1, c);
          reveal(l - 1, c + 1);
          reveal(l, c - 1);
          reveal(l, c + 1);
          reveal(l + 1, c - 1);
          reveal(l + 1, c);
          reveal(l + 1, c + 1);
        }

      }
    }
  }

  void revealAll(bool aGagne){
    for (int line = 0; line < nbLine ; line++){
      for (int col = 0; col < nbCol ; col++){
        if (!aGagne && _cases[line][col].hasFlag){
          toggleFlag(line, col);
        }
        reveal(line, col);
      }
    }
  }

  void explode(int l, int c){
    _cases[l][c].hasExploded = true;
  }

  void toggleFlag(int l, int c){
    _cases[l][c].hasFlag = !_cases[l][c].hasFlag;
  }

  bool getIsBomb(int l, int c){
    print('line : $l ; col : $c');
    return tryGetCase(l, c) != null ? _cases[l][c].hasBomb : false;
  }
  bool getHasFlag(int l, int c) => _cases[l][c].hasFlag;

  int getLines() => nbLine;
  int getCol() => nbCol;


}