class HeroModel {
  String name;
  bool isFavorite;

  HeroModel({required this.name, this.isFavorite = false});

  isChecking(HeroModel model) {
    model.isFavorite = !model.isFavorite;
  }
}
