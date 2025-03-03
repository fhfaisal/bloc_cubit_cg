
import 'package:cubit_bloc/core/storage/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/constants/app_text.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/snackBar.dart';
import '../../../core/utils/validators/validators.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../cubits/auth/auth_state.dart';
import 'widgets/login_header.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> validator = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool showPassword = true;
  bool cShowPassword = true;
  final storage=StorageService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Sign Up")),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            // Save login state
            storage.setLoggedIn(true);
            // Navigate and clear all previous routes
            context.replaceNamed(AppRoutes.home);
          } else if (state is AuthError) {
            SnackBarMessage.error(context: context, message: state.message);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace24),
            child: Form(
              key: validator,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Logo Title & Subtitle with Hero Animation
                  Hero(
                    tag: 'login_header',
                    child: const AppLoginHeader(),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields12),

                  /// Email Field
                  TextFormField(
                    controller: email,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => AppValidators.validateEmail(value),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: AppText.email,
                    ),
                  ),
                  SizedBox(height: AppSizes.spaceBtwInputFields6),

                  /// Password Field
                  TextFormField(
                    controller: password,
                    obscureText: showPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => AppValidators.validatePassword(value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: AppText.password,
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => showPassword = !showPassword),
                        icon: Icon(
                          showPassword ? Iconsax.eye_slash : Iconsax.eye,
                          semanticLabel: showPassword ? 'Hide Password' : 'Show Password',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.spaceBtwInputFields6),

                  /// Password Field
                  TextFormField(
                    controller: confirmPassword,
                    obscureText: cShowPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => AppValidators.validateConfirmPassword(confirmPassword.text, password.text),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: AppText.cPassword,
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => cShowPassword = !cShowPassword),
                        icon: Icon(
                          showPassword ? Iconsax.eye_slash : Iconsax.eye,
                          semanticLabel: showPassword ? 'Hide Password' : 'Show Password',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields12),

                  /// Login Button
                  ElevatedButton(
                    onPressed: () {
                      if (!validator.currentState!.validate()) {
                        SnackBarMessage.warning(
                          context: context,
                          message: AppText.requiredFieldMsg,
                        );
                        return;
                      }
                      context.read<AuthCubit>().signUp(
                            email.text,
                            password.text,
                          );
                    },
                    child: Text(AppText.signUp.toUpperCase()),
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppText.backToLogin),
                      TextButton(
                          onPressed: () {
                            context.go(AppRoutes.login);
                          },
                          child: Text(AppText.login))
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
