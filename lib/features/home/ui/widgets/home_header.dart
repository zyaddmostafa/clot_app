import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/utils/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          child: Image.asset(
            Assets.assetsImagesTestImage,
            height: 45,
            width: 45,
          ),
        ),

        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          child: SvgPicture.asset(
            Assets.assetsSvgsBagIcon,
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }
}
