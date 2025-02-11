
class CaseModel {
  bool hidden = true;
  bool hasBomb = false;
  bool hasExploded = false;
  bool hasFlag = false;
  int? number;

  void setNbBomb(int nb){
    number = nb;
  }
}