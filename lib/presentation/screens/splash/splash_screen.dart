import 'dart:async';

import 'package:e_wallet_mobile/blocs/bloc/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/presentation/screens/screen_entity.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget implements ScreenEntity {
  SplashScreen({Key? key}) : super(key: key);

  @override
  bool isGuard = false;

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
          }

          if (state is AuthFailed) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              RouteCollection.onBoardingScreen.name,
              (route) => false
            );
          }
        },
        child: Center(
          child: Container(
            height: 50,
            width: 155,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/img_logo_dark.png")
                )
            ),
          ),
        ),
      ),
    );
  }
}
