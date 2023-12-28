import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/cubit/product_cubit.dart';
import 'package:store/models/product_model.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_field.dart';
import 'package:store/cubit/product_state.dart';

class UpdateProductPage extends StatelessWidget {
  static String id = 'update product';

  const UpdateProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        ProductCubit cubit = BlocProvider.of<ProductCubit>(context);

        return ModalProgressHUD(
          inAsyncCall: cubit.isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Update Product',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        cubit.productName = data;
                      },
                      hintText: 'Product Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        cubit.desc = data;
                      },
                      hintText: 'description',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        cubit.price = data;
                      },
                      hintText: 'price',
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        cubit.image = data;
                      },
                      hintText: 'image',
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    CustomButton(
                      text: 'Update',
                      onTap: () async {
                        cubit.updateProduct(product);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
