import 'dart:async';

import 'package:e_wallet_mobile/blocs/bloc/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/blocs/bloc/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
            Navigator.of(context).pushNamedAndRemoveUntil("/onboarding", (route) => false);
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
