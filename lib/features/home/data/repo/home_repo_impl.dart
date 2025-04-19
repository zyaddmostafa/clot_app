import 'package:clot_app/features/home/data/apis/home_api_service.dart';
import 'package:clot_app/features/home/data/model/categories_response_model.dart';

class HomeRepoImpl {
  final HomeApiService _homeApiService;
  HomeRepoImpl(this._homeApiService);

  Future<CategoriesResponseModel> getCategories() async {
    try {
      final response = await _homeApiService.getCategories();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
