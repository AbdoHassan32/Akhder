import 'package:akhder/core/utils/service_locator.dart';
import 'package:akhder/features/home/data/repos/home_repo_impl.dart';
import 'package:akhder/features/home/presentation/manager/agricultural_fertilizers_cubit/agricultural_fertilizers_cubit.dart';
import 'package:akhder/features/home/presentation/manager/all_products/all_products_cubit.dart';
import 'package:akhder/features/home/presentation/manager/insecticides_products_cubit/insecticides_products_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/app_router.dart';
import 'features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'features/fonts.dart';
import 'features/home/presentation/manager/corps_products_cubit/corps_products_cubit.dart';
import 'features/home/presentation/manager/seeds_products_cubit/seeds_products_cubit.dart';
import 'features/home/presentation/manager/tools_products_cubit/tools_products_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>LoginCubit()),
        BlocProvider(create:(context)=>RegisterCubit()),
        BlocProvider(
          create: (context) => AgriculturalFertilizersCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchAgriculturalFertilizersProducts(),
        ),
        BlocProvider(
          create: (context) => InsecticidesProductsCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchInsecticidesProducts(),
        ),
        BlocProvider(
          create: (context) => ToolsProductsCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchToolsProducts(),
        ),
        BlocProvider(
          create: (context) => SeedsProductsCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchSeedsProducts(),
        ),
        BlocProvider(
          create: (context) => CorpsProductsCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchCorpsProducts(),
        ),
        BlocProvider(
          create: (context) => AllProductsCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchAllProducts(),
        ),


      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: kNotoSansArabicFont,
        ),
      ),
    );
  }
}