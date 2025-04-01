import 'package:clot_app/core/utils/assets_images.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/login/ui/cubits/login_cubit/login_cubit.dart';
import 'package:clot_app/features/login/ui/widgets/social_media_login_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialMediaLoginList extends StatelessWidget {
  const SocialMediaLoginList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaLoginItem(
          imageName: Assets.assetsImagesGoogleLogo,
          text: 'continue with Google',
          onTap: () {
            context.read<LoginCubit>().loginWithGoogle();
          },
        ),
        verticalSpace(12),
        SocialMediaLoginItem(
          imageName: Assets.assetsImagesFacebookLogo,
          text: 'continue with Facebook',
          onTap: () {
            context.read<LoginCubit>().loginWithFacebook();
          },
        ),
      ],
    );
  }
}
