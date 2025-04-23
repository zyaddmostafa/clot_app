import 'package:clot_app/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).cardColor,
      child: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Theme.of(context).primaryColor,
          size: 16,
        ),
      ),
    );
  }
}
