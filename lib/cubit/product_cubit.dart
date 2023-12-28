import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/cubit/product_state.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_product_service.dart';
import 'package:store/services/update_product.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState());
  List<ProductModel>? products;
  void getProducts() async{
    emit(ProductLoadingState());
    try {
      products = await AllProductsService.getAllProducts();
      print(products);
      emit(ProductSuccessState());
    } on Exception catch (error) {
      print(error);
      emit(ProductFailureState());
    }
  }

  String? productName, desc, image;

  String? price;
  bool isLoading = false;

  void updateProduct(ProductModel product) async {
    emit(UpdateProductLoadingState());
    isLoading = true;

    try {
      await UpdateProductService.updateProduct(id: product.id, title: productName == null ? product.title : productName!, price: price == null ? product.price.toString() : price!, desc: desc == null ? product.description : desc!, image: image == null ? product.image : image!, category: product.category);

      emit(UpdateProductSuccessState());
      isLoading = false;
    } catch (e) {
      emit(UpdateProductFailureState());
      isLoading = false;
    }
  }
}
