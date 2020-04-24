import 'package:pack_ecommers/models/category.dart';
import 'package:pack_ecommers/models/product.dart';

class DbApi {
  List<Category> getCategories() {
    List<Category> temp = [Category(), Category(), Category(), Category()];
    return temp;
  }

  List<Product> getProducts(Category category) {
    List<Product> temp = [
      Product.create("product"),
      Product.create("product"),
      Product.create("product"),
    ];
    return temp;
  }
}
