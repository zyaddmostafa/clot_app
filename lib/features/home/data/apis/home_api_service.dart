import 'package:clot_app/core/apis_helpers/api_constants.dart';
import 'package:clot_app/features/home/data/apis/home_api_constants.dart';
import 'package:clot_app/features/home/data/model/categories_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.categoriesCollection)
  Future<CategoriesResponseModel> getCategories();
}
