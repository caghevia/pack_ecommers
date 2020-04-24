import 'dart:async';

import 'package:pack_ecommers/api/db_api.dart';
import 'package:pack_ecommers/models/category.dart';
import 'package:pack_ecommers/widgets/bloc_provider.dart';

class CategoriesBloc implements BlocBase {
  CategoriesBloc() {
    getCategories();
  }

  List<Category> _categories;
  List<Category> get selectedCategory => _categories;

  final _categoriescontroller = StreamController<List<Category>>();

  Stream<List<Category>> get outCategories => _categoriescontroller.stream;
  Sink<List<Category>> get _inCategories => _categoriescontroller.sink;

  void getCategories() {
    DbApi dbApi = DbApi();
    _categories = dbApi.getCategories();
    _inCategories.add(_categories);
  }

  @override
  void dispose() {
    _categoriescontroller.close();
  }
}
