import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubit/product_cubit.dart';
import 'package:store/screens/home_page.dart';
import 'package:store/screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: MaterialApp(
        routes: {
          HomePage.id: (context) => const HomePage(),
          UpdateProductPage.id: (context) => const UpdateProductPage(),
        },
        initialRoute: HomePage.id,
      ),
    );
  }
}
