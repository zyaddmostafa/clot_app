import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/search_textfiled.dart';
import 'package:clot_app/features/home/ui/widgets/categories_section.dart';
import 'package:clot_app/features/home/ui/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              verticalSpace(30),
              const HomeHeader(),
              verticalSpace(24),
              const SearchTextfiled(),
              verticalSpace(24),
              const CategoriesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
