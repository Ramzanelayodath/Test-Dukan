


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_dukan/splash_screen/cubit/splash_cubit.dart';
import 'package:machine_test_dukan/util/router_variables.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashCubit>(context).loadSplash();
    return Scaffold(
      body: BlocListener<SplashCubit,SplashState>(
        listener: (context,state){
          if(state is SplashLoaded){
            Navigator.pop(context);
            Navigator.pushNamed(context, login);

          }
        },
        child: body(context),
      ),
    );
  }

  Widget body(BuildContext context){
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height/2,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width, 180.0)),
          ),
        ),


      ],
    );
  }
}