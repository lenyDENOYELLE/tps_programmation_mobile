
class CaseModel {
  bool hidden = true;
  bool hasBomb = false;
  bool hasExploded = false;
  bool hasFlag = false;
  int? nbBomb;

  void setNbBomb(int nb){
    nbBomb = nb;
  }
}