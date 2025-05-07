import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final double height, width;
  final VoidCallback? onTap;
  const UserImage({super.key, this.height = 40, this.width = 40, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          FirebaseAuth.instance.currentUser?.photoURL ??
              'https://png.pngtree.com/png-clipart/20191120/original/pngtree-outline-user-icon-png-image_5045523.jpg',
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
