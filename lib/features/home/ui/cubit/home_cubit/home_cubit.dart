import 'package:bloc/bloc.dart';
import 'package:clot_app/features/home/data/model/category_response_model.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/home/data/repo/home_repo_impl.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl homeRepoImpl;
  HomeCubit(this.homeRepoImpl) : super(HomeInitial());

  void getCategories() async {
    emit(HomeCategoryLoading());
    try {
      final categories = await homeRepoImpl.getCategories();
      emit(HomeCategorySuccess(categories: categories.categories));
    } catch (e) {
      emit(HomeCategoryError(errorMessage: e.toString()));
    }
  }

  void getProduct() async {
    emit(HomeProductLoading());
    try {
      final products = await homeRepoImpl.getProduct();

      emit(HomeProductSuccess(products: products.products));
    } catch (e) {
      emit(HomeProductError(errorMessage: e.toString()));
    }
  }

  void getFilterProduct(String categoryName) async {
    emit(HomeFilterProductLoading());
    try {
      final products = await homeRepoImpl.getFilterProduct(
        category: categoryName,
      );

      emit(HomeFilterProductSuccess(products: products.products));
    } catch (e) {
      emit(HomeFilterProductError(errorMessage: e.toString()));
    }
  }
}
