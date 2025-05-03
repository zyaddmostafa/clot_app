import 'package:bloc/bloc.dart';
import 'package:clot_app/features/checkout/data/models/checkout_request_model.dart';
import 'package:clot_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepoImpl checkoutRepoImpl;
  CheckoutCubit(this.checkoutRepoImpl) : super(CheckoutInitial());
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addOrder(CheckoutRequestModel checkoutRequestModel) async {
    emit(CheckoutAddOrderLoading());
    try {
      await checkoutRepoImpl.addOrder(checkoutRequestModel);
      emit(CheckoutAddOrderSuccess('Order added successfully'));
      addressController.clear();
    } catch (e) {
      emit(CheckoutAddOrderError(e.toString()));
      addressController.clear();
    }
  }
}
