import 'package:pack_ecommers/models/product.dart';
import 'package:flutter/material.dart';

class SelectedCategoryPage extends StatelessWidget {
  const SelectedCategoryPage({Key key, @required this.products})
      : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: products.map((product) => Text(product.name)).toList(),
      ),
    );
  }
}
