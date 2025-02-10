import './CaseModel.dart';
class MapModel {
  int nbLine = 0;
  int nbCol = 0;
  int nbBomb = 0;
  List<List<CaseModel>> _cases = List<List<CaseModel>>.empty();

  void initCases(){
    _cases =
    List<List<CaseModel>>.generate(nbLine, (int index) =>
        List<CaseModel>.generate(nbCol, (int index) => CaseModel() , growable: false),
        growable: false
    );
  }
}