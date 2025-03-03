
import 'package:cubit_bloc/core/storage/storage_constants.dart';
import 'package:cubit_bloc/core/storage/storage_service.dart';
import 'package:cubit_bloc/presentation/pages/auth/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/constants/app_text.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_function.dart';
import '../../../core/utils/helpers/snackBar.dart';
import '../../../core/utils/validators/validators.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../cubits/auth/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
///Variables
GlobalKey<FormState> validator = GlobalKey<FormState>();
final email = TextEditingController();
final password = TextEditingController();
bool showPassword = true;
bool remember = false;
final StorageService storage=StorageService();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(title: Text(AppText.login)),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            storage.setLoggedIn(true);
            // Navigate and clear all previous routes
            context.replaceNamed(AppRoutes.home);
          } else if (state is AuthError) {
            SnackBarMessage.warning(context: context, message: state.message);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace24),
            child: Form(
              key: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                spacing: AppSizes.spaceBtwInputFields12,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///Logo Title & Subtitle
                  const AppLoginHeader(),

                  ///Email
                  TextFormField(
                    controller: email,
                    validator: (value) => AppValidators.validateEmail(value),
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: AppText.email),
                  ),
                  SizedBox(height: AppSizes.spaceBtwInputFields6),
                  ///Password
                  TextFormField(
                    controller: password,
                    obscureText: showPassword,
                    validator: (value) => AppValidators.validatePassword(value),
                    //onChanged: (value) => AppValidators.validatePassword(value),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: AppText.password,
                        suffixIcon: IconButton(
                          onPressed: () =>setState(()=> showPassword = !showPassword),
                          icon: Icon(showPassword ? Iconsax.eye_slash : Iconsax.eye),
                        )),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields6),
                  ElevatedButton(
                    onPressed: () {
                      if(!validator.currentState!.validate()) {
                        SnackBarMessage.error(context: context, message: AppText.requiredFieldMsg,);
                        return;
                      };
                      context.read<AuthCubit>().signIn(
                        email.text,
                        password.text,
                      );
                    },
                    child: Text(AppText.login.toUpperCase()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
