import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/ui/widgets/shop_by_categories_list.dart';
import 'package:flutter/material.dart';

class ShopByCategoriesScreen extends StatelessWidget {
  const ShopByCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(30),
              CircleAvatar(
                backgroundColor: Theme.of(context).cardColor,
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                ),
              ),
              verticalSpace(16),
              const Text('Shop by Categories', style: AppTextStyles.font24Bold),
              verticalSpace(14),

              const ShopByCategoriesList(),
            ],
          ),
        ),
      ),
    );
  }
}
