import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<void> showAppBottomSheet(
    BuildContext context, {
    required Widget child,
    double? height,
  }) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return child;
      },
    );
  }
}
