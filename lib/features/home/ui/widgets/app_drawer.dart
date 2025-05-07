// lib/features/home/ui/widgets/app_drawer.dart
import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/user_image.dart';
import 'package:clot_app/features/home/ui/cubit/cubit/theme_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  const UserImage(
                    height: 80,
                    width: 80,

                    // Replace with actual user image URL
                  ),
                  verticalSpace(12),
                  Text(
                    FirebaseAuth
                        .instance
                        .currentUser!
                        .displayName!, // Replace with actual user name
                    style: AppTextStyles.font16Bold,
                  ),
                  Text(
                    FirebaseAuth
                        .instance
                        .currentUser!
                        .email!, // Replace with actual user email
                    style: AppTextStyles.font14Regular,
                  ),
                ],
              ),
            ),
            const Divider(),
            _buildDrawerItem(
              context,
              icon: Icons.settings_outlined,
              title: 'Settings',
              route: Routes.profileScreen,
            ),
            _buildDrawerItem(
              context,
              icon: Icons.shopping_bag_outlined,
              title: 'My Orders',
              route: Routes.orderHistoryScreen,
            ),
            _buildDrawerItem(
              context,
              icon: Icons.favorite_border,
              title: 'Wishlist',
              route: Routes.wishListScreen,
            ),
            verticalSpace(48),
            const DarkOrLightModeAppTheme(),

            const Spacer(),
            const Divider(),
            _buildDrawerItem(
              context,
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                // Handle logout
                // context.read<AuthCubit>().logout();
                Navigator.of(context).pop(); // Close drawer
                Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? route,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).iconTheme.color),
      title: Text(title, style: AppTextStyles.font14Bold),
      onTap:
          onTap ??
          () {
            Navigator.of(context).pop(); // Close drawer first
            if (route != null) {
              Navigator.of(context).pushNamed(route);
            }
          },
    );
  }
}

class DarkOrLightModeAppTheme extends StatelessWidget {
  const DarkOrLightModeAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state is ThemeLoaded ? state.isDarkMode : false;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.light_mode),
              label: const Text('Dark'),
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isDarkMode
                        ? Theme.of(context).cardColor
                        : AppColors.primaryColor,
                foregroundColor: isDarkMode ? Colors.black : Colors.white,
              ),
            ),
            horizontalSpace(16),
            ElevatedButton.icon(
              icon: const Icon(Icons.dark_mode),
              label: const Text('Light'),
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isDarkMode
                        ? AppColors.primaryColor
                        : Theme.of(context).cardColor,
                foregroundColor: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
