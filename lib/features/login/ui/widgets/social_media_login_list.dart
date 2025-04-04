import 'package:clot_app/core/utils/assets_images.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/login/ui/widgets/social_media_login_item.dart';
import 'package:flutter/material.dart';

class SocialMediaLoginList extends StatelessWidget {
  const SocialMediaLoginList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SocialMediaLoginItem(
          imageName: Assets.assetsImagesGoogleLogo,
          text: 'continue with Google',
        ),
        verticalSpace(12),
        const SocialMediaLoginItem(
          imageName: Assets.assetsImagesFacebookLogo,
          text: 'continue with Facebook',
        ),
      ],
    );
  }
}
