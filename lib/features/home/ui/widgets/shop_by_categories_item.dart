import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/assets_images.dart';
import 'package:flutter/material.dart';

class ShopByCategoriesItem extends StatelessWidget {
  const ShopByCategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: ClipRRect(
              child: Image.asset(
                Assets.assetsImagesTestImage2,
                height: 50,
                width: 50,
              ),
            ),
          ),

          const Text('Hoodies', style: AppTextStyles.font16Regular),
        ],
      ),
    );
  }
}
