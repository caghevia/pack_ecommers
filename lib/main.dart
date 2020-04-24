import 'package:pack_ecommers/blocs/cart_bloc.dart';
import 'package:pack_ecommers/blocs/categories_bloc.dart';
import 'package:pack_ecommers/pages/home_page.dart';
import 'package:pack_ecommers/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      bloc: CartBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          bloc: CategoriesBloc(),
          child: MyHomePage(),
        ),
      ),
    );
  }
}
