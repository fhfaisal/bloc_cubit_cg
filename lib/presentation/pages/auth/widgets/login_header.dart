import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_text.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_function.dart';

class AppLoginHeader extends StatelessWidget {
  const AppLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Image(height: 150, image: AssetImage(dark ? AppImageStrings.logo : AppImageStrings.logoDark)),
        Text(AppText.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AppSizes.sm_8),
        Text(AppText.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
