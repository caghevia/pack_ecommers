class Product {
  static const NAME_KEY = 'name';
  Product.create(this.name);

  String name;
  String id;
  int amount;

  Product.fromFirebase(Map<String, dynamic> json) {
    name = json[NAME_KEY];
  }
}
