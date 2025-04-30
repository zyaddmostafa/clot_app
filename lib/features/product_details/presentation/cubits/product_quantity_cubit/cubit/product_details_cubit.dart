import 'package:bloc/bloc.dart';

class ProductDetailsCubit extends Cubit<int> {
  ProductDetailsCubit() : super(1);
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state != 1) {
      emit(state - 1);
    }
  }

  void selectColor(int index) {
    selectedColorIndex = index;
    emit(index);
  }

  void selectSize(int index) {
    selectedSizeIndex = index;
    emit(index);
  }
}
