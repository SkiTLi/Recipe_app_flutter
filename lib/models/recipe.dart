class Recipe {
  final String id;
  final String name;
  final String category;
  final String? picture;

  Recipe({
    required this.id,
    required this.name,
    required this.category,
    this.picture,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      picture: json['strMealThumb'],
    );
  }

  @override
  String toString() {
    return '---Recipe: id=$id,name=$name,category=$category,picture=$picture';
  }
}
