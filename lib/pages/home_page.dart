import 'package:pack_ecommers/blocs/categories_bloc.dart';
import 'package:pack_ecommers/blocs/products_bloc.dart';
import 'package:pack_ecommers/models/category.dart';
import 'package:pack_ecommers/models/product.dart';
import 'package:pack_ecommers/pages/selected_category_page.dart';
import 'package:pack_ecommers/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CategoriesBloc _categoriesBloc =
        BlocProvider.of<CategoriesBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce'),
      ),
      body: StreamBuilder<List<Category>>(
        stream: _categoriesBloc.outCategories,
        builder: (context, categories) {
          if (categories.hasData) {
            return ListView.builder(
              itemCount: categories.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        bloc: ProductsBloc(categories.data[index]),
                        child: SelectedCategoryPage(),
                      ),
                    ),
                  ),
                  title: Text(
                    categories.data[index].name,
                    style: TextStyle(fontSize: 24.0),
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
