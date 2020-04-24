import 'dart:async';

import 'package:pack_ecommers/models/cart.dart';
import 'package:pack_ecommers/models/product.dart';
import 'package:pack_ecommers/widgets/bloc_provider.dart';
import 'package:rxdart/subjects.dart';

class CartBloc extends BlocBase {
  CartBloc() {
    getCart();
  }

  Cart _cart;
  Cart get cart => _cart;

  final _productsController = BehaviorSubject<List<Product>>();
  Stream<List<Product>> get outProducts => _productsController.stream;
  Sink<List<Product>> get _inProducts => _productsController.sink;

  final _countController = BehaviorSubject<int>();
  Stream<int> get outCount => _countController.stream;
  Sink<int> get _inCount => _countController.sink;

  @override
  void dispose() {
    _productsController.close();
    _countController.close();
  }

  void getCart() {
    _cart = Cart();
  }
}
