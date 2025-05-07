import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:clot_app/features/profile/presentation/widgets/list_of_one_order.dart';
import 'package:clot_app/features/profile/presentation/widgets/shimmer_list_of_one_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Row(
                spacing: 90.w,
                children: const [
                  PopButton(),
                  Text('Order History', style: AppTextStyles.font16Bold),
                ],
              ),
              verticalSpace(32),
              BlocBuilder<CheckoutCubit, CheckoutState>(
                buildWhen:
                    (previous, current) =>
                        current is CheckoutGetAllOrdersLoading ||
                        current is CheckoutGetAllOrdersSuccess ||
                        current is CheckoutGetAllOrdersError,
                builder: (context, state) {
                  if (state is CheckoutGetAllOrdersLoading) {
                    return const ShimmerListOfOneOrder();
                  } else if (state is CheckoutGetAllOrdersError) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: AppTextStyles.font16Bold,
                      ),
                    );
                  } else if (state is CheckoutGetAllOrdersSuccess) {
                    // Here you can use the orders data from state.orders
                    return _getAllOrderListView(state);
                  } else {
                    return const Center(child: Text('No orders found'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _getAllOrderListView(CheckoutGetAllOrdersSuccess state) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.orders.length,
        itemBuilder: (_, index) {
          return Column(
            children: List.generate(
              state.orders[index].orderItems.length,
              (i) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ListOfOneOrder(
                  orderStatus: state.orders[index].orderStatus,
                  orderModel: state.orders[index].orderItems[i],
                  orderDate: (state.orders[index].createdDate).split(' ')[0],
                  orderAddress: state.orders[index].address,
                  orderSubTotal: state.orders[index].subTotalPrice.toString(),
                  oneOrderProductsCount: state.orders[index].orderItems.length,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
