import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/assets_images.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/core/widgets/user_image.dart';
import 'package:clot_app/features/profile/presentation/widgets/profile_screen_option_item.dart';
import 'package:clot_app/features/profile/presentation/widgets/user_profile_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.popButtonVisible});
  final bool popButtonVisible;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              if (popButtonVisible)
                const Align(
                  alignment: AlignmentDirectional.topStart,
                  child: PopButton(),
                ),

              verticalSpace(80),
              Stack(
                children: [
                  UserImage(height: 80.h, width: 80.w),
                  Positioned(
                    left: 55,
                    top: 60,
                    child: Image.asset(
                      Assets.assetsImagesCamera,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),

              verticalSpace(32),
              const UserProfileInfo(),
              verticalSpace(26),
              ProfileScreenOptionItem(
                title: 'Wishlist',
                onTap: () {
                  Navigator.pushNamed(context, Routes.wishListScreen);
                },
              ),
              verticalSpace(16),
              ProfileScreenOptionItem(
                title: 'My Orders',
                onTap: () {
                  Navigator.pushNamed(context, Routes.orderHistoryScreen);
                },
              ),
              verticalSpace(64),
              InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.loginScreen,
                      (route) => false,
                    );
                  });
                },
                child: Text(
                  'Sign Out',
                  style: AppTextStyles.font24Bold.copyWith(
                    fontSize: 18,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
