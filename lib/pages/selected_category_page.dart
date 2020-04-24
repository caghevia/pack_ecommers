import 'package:pack_ecommers/blocs/products_bloc.dart';
import 'package:pack_ecommers/models/product.dart';
import 'package:flutter/material.dart';
import 'package:pack_ecommers/widgets/bloc_provider.dart';

class SelectedCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductsBloc _productsBloc = BlocProvider.of<ProductsBloc>(context);

    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<List<Product>>(
          stream: _productsBloc.outProducts,
          builder: (context, products) {
            if (products.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: products.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(child: Text(products.data[index].name));
                },
              );
            }
            return SizedBox();
          },
        ));
  }
}
