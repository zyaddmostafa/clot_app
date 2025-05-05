import 'package:clot_app/core/di/dependency_injection.dart';
import 'package:clot_app/features/home/data/repo/home_repo_impl.dart';
import 'package:clot_app/features/home/ui/cubit/home_cubit/home_cubit.dart';
import 'package:clot_app/features/home/ui/screens/home_screen.dart';
import 'package:clot_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:clot_app/features/wishlist/presentation/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// other imports...

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Your screens list
  final List<Widget> _screens = [
    BlocProvider(
      create:
          (context) =>
              HomeCubit(getIt<HomeRepoImpl>())
                ..getCategories()
                ..getProduct(),
      child: const HomeScreen(),
    ),
    const WishListScreen(),
    const ProfileScreen(popButtonVisible: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home_outlined, Icons.home, 'Home'),
            _buildNavItem(
              1,
              Icons.favorite_outline_sharp,
              Icons.favorite,
              'Wishlist',
            ),
            _buildNavItem(2, Icons.person_outline, Icons.person, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData inactiveIcon,
    IconData activeIcon,
    String label,
  ) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        if (_selectedIndex != index) {
          setState(() => _selectedIndex = index);
          _controller.reset();
          _controller.forward();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: isSelected ? 8 : 6,
        ),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppColors.primaryColor.withValues(alpha: 0.1)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                isSelected ? activeIcon : inactiveIcon,
                color: isSelected ? AppColors.primaryColor : Colors.grey,
                size: isSelected ? 26 : 24,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: isSelected ? 12 : 11,
                color: isSelected ? AppColors.primaryColor : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
