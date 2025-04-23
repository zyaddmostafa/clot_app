import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/home/ui/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.categoryName});
  final String categoryName;
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
              const PopButton(),
              verticalSpace(16),
              Text('$categoryName (240)', style: AppTextStyles.font16Bold),
              verticalSpace(24),
              // here create for me a grid builder with 2 columns and 2 items in each column
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.58,
                  ),
                  itemCount: 10, // Replace with your actual item count
                  itemBuilder: (context, index) {
                    return ProductListItem(
                      productModel: ProductModel(
                        title: 'Men\'s Jacket',
                        image:
                            ' https://media.boohoo.com/i/boohoo/bmm24245_black',
                        price: '20',
                        description: 'Men\'s Jacket',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
