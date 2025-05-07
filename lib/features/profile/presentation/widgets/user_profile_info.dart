import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Theme.of(context).cardColor /* Bg-Dark-2 */,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FirebaseAuth.instance.currentUser?.displayName ?? 'User Name',
                style: AppTextStyles.font16Bold,
              ),
              verticalSpace(8),

              Text(
                FirebaseAuth.instance.currentUser?.email ?? "No Email",
                style: AppTextStyles.font16Regular.copyWith(
                  color: Theme.of(context).primaryColor.withValues(alpha: 128),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            'Edit',
            style: AppTextStyles.font16Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
