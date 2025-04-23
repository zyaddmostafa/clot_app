import 'package:bloc/bloc.dart';
import 'package:clot_app/features/home/data/model/category_response_model.dart';
import 'package:clot_app/features/home/data/repo/home_repo_impl.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl homeRepoImpl;
  HomeCubit(this.homeRepoImpl) : super(HomeInitial());

  void getCategories() async {
    emit(HomeCategoryLoading());
    try {
      final categories = await homeRepoImpl.fetchCategories();
      emit(HomeCategorySuccess(categories: categories.categories));
    } catch (e) {
      emit(HomeCategoryError(errorMessage: e.toString()));
    }
  }
}
