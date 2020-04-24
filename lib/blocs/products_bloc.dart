import 'dart:async';

import 'package:pack_ecommers/api/db_api.dart';
import 'package:pack_ecommers/models/category.dart';
import 'package:pack_ecommers/models/product.dart';
import 'package:pack_ecommers/widgets/bloc_provider.dart';

class ProductsBloc implements BlocBase {
  ProductsBloc(Category category) {
    getProducts(category);
  }

  List<Product> _products;
  List<Product> get selectedProduct => _products;

  final _productsController = StreamController<List<Product>>();

  Stream<List<Product>> get outProducts => _productsController.stream;
  Sink<List<Product>> get _inProducts => _productsController.sink;

  void getProducts(Category category) {
    DbApi dbApi = DbApi();
    _products = dbApi.getProducts(category);
    _inProducts.add(_products);
  }

  @override
  void dispose() {
    _productsController.close();
  }
}
