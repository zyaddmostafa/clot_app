import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/app_text_field.dart';
import 'package:clot_app/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutAddressApplying extends StatelessWidget {
  const CheckoutAddressApplying({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            const Text('Shipping Address', style: AppTextStyles.font14Bold),
            verticalSpace(8),
            Form(
              key: context.read<CheckoutCubit>().formKey,
              child: AppTextField(
                hintText: 'Enter your full address',
                maxLines: 3,

                controller: context.read<CheckoutCubit>().addressController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
