class Ingredient {
  final String id;
  final String name;
  final String? picture;

  Ingredient({
    required this.id,
    required this.name,
    this.picture,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {

    return Ingredient(
      id: json['idIngredient'],
      name: json['strIngredient'],
      picture: 'https://themealdb.com/images/ingredients/' + json['strIngredient'] + '-Small.png',
    );
  }

  @override
  String toString() {
    return '---Ingredient: id=$id,name=$name,picture=$picture';
  }
}
