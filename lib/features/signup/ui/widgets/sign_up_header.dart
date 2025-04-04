import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).cardColor,
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Theme.of(context).iconTheme.color,
          size: 16,
        ),
      ),
    );
  }
}
