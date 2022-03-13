

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_dukan/firebase/firebase_service.dart';
import 'package:machine_test_dukan/home/cubit/home_cubit.dart';
import 'package:machine_test_dukan/home/view/home_screen.dart';
import 'package:machine_test_dukan/login/cubit/login_cubit.dart';
import 'package:machine_test_dukan/login/view/login_screen.dart';
import 'package:machine_test_dukan/network/network.dart';
import 'package:machine_test_dukan/repository/repository.dart';
import 'package:machine_test_dukan/splash_screen/cubit/splash_cubit.dart';
import 'package:machine_test_dukan/splash_screen/view/splash_screen.dart';
import 'package:machine_test_dukan/util/router_variables.dart';

class AppRouter{
  late Repository repository;

  AppRouter() {
    repository = Repository(Network(),FirebaseService());
  }
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/' :
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (BuildContext context) =>SplashCubit(),
          child: SplashScreen(),
        ));
      case login :
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (BuildContext context) =>LoginCubit(repository),
          child: LoginScreen(),
        ));
      case home :
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (BuildContext context) =>HomeCubit(),
          child: HomeScreen(settings.arguments as String),
        ));

    }
  }
}