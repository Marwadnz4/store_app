import 'package:store/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api.get(endPoint: 'products/categories');

    return data;
  }
}
