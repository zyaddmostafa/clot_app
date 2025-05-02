import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/app_bottom_sheet.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/product_details/presentation/cubits/product_quantity_cubit/cubit/cubit/product_details_cubit.dart';
import 'package:clot_app/features/product_details/presentation/widgets/product_bottom_sheet_color_widget.dart';
import 'package:clot_app/features/product_details/presentation/widgets/product_bottom_sheet_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectSizeAndSelectColor extends StatelessWidget {
  const SelectSizeAndSelectColor({
    super.key,
    required this.title,
    this.color,
    this.colorList,
    this.sizeModel,
    this.size,
  });
  final String title;
  final Color? color;
  final ColorList? colorList;
  final SizeModel? sizeModel;
  final String? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (color != null) {
          AppBottomSheet.showAppBottomSheet(
            context,
            child: BlocProvider.value(
              value: BlocProvider.of<ProductDetailsCubit>(context),

              child: ProductBottomSheetColorWidget(colorList: colorList!),
            ),
          );
        } else {
          AppBottomSheet.showAppBottomSheet(
            context,
            child: BlocProvider.value(
              value: BlocProvider.of<ProductDetailsCubit>(context),

              child: ProductSizeBottomSheetWidget(sizeModel: sizeModel),
            ),
          );
        }
      },
      child: Container(
        height: 56.h,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: ShapeDecoration(
          color: const Color(0xFF342F3F) /* Bg-Dark-2 */,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyles.font16Regular),
            Row(
              children: [
                if (color != null)
                  Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  )
                else
                  Text(size.toString(), style: AppTextStyles.font16Bold),
                horizontalSpace(22),

                Transform.rotate(
                  angle: -90 * 3.14 / 180,
                  child: const Icon(Icons.arrow_back_ios_outlined, size: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
