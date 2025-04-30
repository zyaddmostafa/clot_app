import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  int quantity = 1;

  void increment() {
    emit(ProductDetailsQuantaty(quantity: ++quantity));
  }

  void decrement() {
    if (quantity != 1) {
      emit(ProductDetailsQuantaty(quantity: --quantity));
    }
  }

  void selectColor(int index) {
    selectedColorIndex = index;
    emit(ProductDetailsSelectedColor(selectedColorIndex: index));
  }

  void selectSize(int index) {
    selectedSizeIndex = index;
    emit(ProductDetailsSelectedSize(selectedSizeIndex: index));
  }
}
