
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../constants/colors.dart';

class SnackBarMessage {
  static void _showSnackBar({
    required BuildContext context,
    required String message,
    required IconData icon,
    required Color backgroundColor,
    int duration = 3,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final theme = Theme.of(context);
    final snackBar = SnackBar(
      content: TweenAnimationBuilder(
        tween: Tween<double>(begin: 1.0, end: 0.0),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn,
        builder: (context, double value, child) {
          return Transform.translate(
            offset: Offset(value * 100, 0), // Moves from right to left
            child: Opacity(
              opacity: 1 - value, // Fades in as it moves
              child: child,
            ),
          );
        },
        child: Row(
          children: [
            Icon(icon, color: AppColors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      dismissDirection: DismissDirection.horizontal,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void success({
    required BuildContext context,
    required String message,
    int duration = 3,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      icon: Iconsax.check_copy,
      backgroundColor: AppColors.success,
      duration: duration,
    );
  }

  static void warning({
    required BuildContext context,
    required String message,
    int duration = 4,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      icon: Iconsax.warning_2,
      backgroundColor: Colors.orange,
      duration: duration,
    );
  }

  static void error({
    required BuildContext context,
    required String message,
    int duration = 5,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      icon: Iconsax.close_circle,
      backgroundColor: Colors.red.shade600,
      duration: duration,
    );
  }

  static void hideCurrent(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}