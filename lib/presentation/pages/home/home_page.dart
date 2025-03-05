import 'package:cubit_bloc/core/storage/storage_constants.dart';
import 'package:cubit_bloc/core/storage/storage_service.dart';
import 'package:cubit_bloc/core/utils/constants/app_text.dart';
import 'package:cubit_bloc/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cubit_bloc/core/routes/app_routes.dart';

import '../../../core/utils/theme/cubit/theme_cubit.dart';
import '../../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_bloc/core/storage/storage_service.dart';
import 'package:cubit_bloc/core/routes/app_routes.dart';
import 'package:cubit_bloc/core/di/injection_container.dart';
import 'package:cubit_bloc/core/utils/theme/cubit/theme_cubit.dart';

import 'widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: HomeDrawer(),
      body: Center(
        child: Text('This is just a boilerplate'),
      ),
    );
  }
}


