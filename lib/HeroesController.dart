import 'package:app_hero/HeroModel.dart';
import 'package:flutter/cupertino.dart';

class HeroesController extends ChangeNotifier {
  List<HeroModel> heroes = [
    HeroModel(name: "Spider Man"),
    HeroModel(name: "Dr. Strange"),
    HeroModel(name: "Hulk"),
    HeroModel(name: "BatMan"),
    HeroModel(name: "Iron Man"),
  ];
}
