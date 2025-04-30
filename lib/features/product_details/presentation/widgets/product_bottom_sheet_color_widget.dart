import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/product_details/presentation/cubits/product_quantity_cubit/cubit/product_details_cubit.dart';
import 'package:clot_app/features/product_details/presentation/widgets/product_bottom_sheet_color_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBottomSheetColorWidget extends StatelessWidget {
  const ProductBottomSheetColorWidget({super.key, required this.colorList});
  final ColorList colorList;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,

      height: MediaQuery.of(context).size.height * 0.5,
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Color(0xFF1D182A) /* Bg-Dark-1 */,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Color', style: AppTextStyles.font24Bold),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.close, size: 24),
                ),
              ],
            ),
            verticalSpace(20),
            Expanded(
              child: ListView.builder(
                itemCount: colorList.colors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: BlocBuilder<ProductDetailsCubit, int>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            context.read<ProductDetailsCubit>().selectColor(
                              index,
                            );
                            context.pop();
                          },
                          child: ProductBottomSheetColorItem(
                            colorItem: colorList.colors[index],
                            isSelected:
                                context
                                    .read<ProductDetailsCubit>()
                                    .selectedColorIndex ==
                                index,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
