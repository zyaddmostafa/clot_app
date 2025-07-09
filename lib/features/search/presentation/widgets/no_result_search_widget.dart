import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/assets_images.dart';
import 'package:clot_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class NoResultSearchWidget extends StatelessWidget {
  const NoResultSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          Assets.assetsImagesSearchIcon, // Use your SVG asset here
          height: 100,
        ),
        const SizedBox(height: 32),
        // Message
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            "Sorry, we couldn't find any matching result for your Search.",
            textAlign: TextAlign.center,
            style: AppTextStyles.font24Medium,
          ),
        ),
        const SizedBox(height: 32),
        // Explore Categories button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: AppButton(
            text: "Explore Categories",
            onPressed: () {
              // TODO: Navigate to categories
            },
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
