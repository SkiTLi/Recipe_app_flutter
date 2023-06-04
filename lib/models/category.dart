class Category {
  final String id;
  final String name;
  final String? picture;

  Category({
    required this.id,
    required this.name,
    this.picture,
  });
  factory Category.fromJson(Map<String, dynamic> json) {

    return Category(
      id: json['idCategory'],
      name: json['strCategory'],
      picture: json['strCategoryThumb'],
    );
  }

  @override
  String toString() {
    return '---Category: id=$id,name=$name,picture=$picture';
  }
}
