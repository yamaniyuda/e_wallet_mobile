import 'package:e_wallet_mobile/blocs/bloc/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/blocs/bloc/user/user_bloc.dart';
import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/screens/data_package_screen.dart';
import 'package:e_wallet_mobile/ui/screens/data_provider_screen.dart';
import 'package:e_wallet_mobile/ui/screens/home_screen.dart';
import 'package:e_wallet_mobile/ui/screens/onboarding_screen.dart';
import 'package:e_wallet_mobile/ui/screens/pin_screen.dart';
import 'package:e_wallet_mobile/ui/screens/profile_pin_update_screen.dart';
import 'package:e_wallet_mobile/ui/screens/profile_screen.dart';
import 'package:e_wallet_mobile/ui/screens/profile_update_screen.dart';
import 'package:e_wallet_mobile/ui/screens/profile_update_success.dart';
import 'package:e_wallet_mobile/ui/screens/sign_in_screen.dart';
import 'package:e_wallet_mobile/ui/screens/sign_up_screen.dart';
import 'package:e_wallet_mobile/ui/screens/sign_up_success.dart';
import 'package:e_wallet_mobile/ui/screens/sign_up_upload_idcard_screen.dart';
import 'package:e_wallet_mobile/ui/screens/sign_up_upload_screen.dart';
import 'package:e_wallet_mobile/ui/screens/splash_screen.dart';
import 'package:e_wallet_mobile/ui/screens/top_up_amount_screen.dart';
import 'package:e_wallet_mobile/ui/screens/top_up_screen.dart';
import 'package:e_wallet_mobile/ui/screens/success_screen.dart';
import 'package:e_wallet_mobile/ui/screens/transfer_amount_screen.dart';
import 'package:e_wallet_mobile/ui/screens/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(AuthGetCurrentUser())),
        BlocProvider(create: (context) => UserBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            iconTheme: IconThemeData(color: blackColor),
            centerTitle: true,
          )
        ),
        initialRoute: RouteCollection.splashScreen.name,
        onGenerateRoute: RouteController.generateRouteSettings,
        // routes: {
        //   "/": (context) => const SplashScreen(),
        //   "/onboarding": (context) => const OnboardingScreen(),
        //   "/sign-in": (context) => const SignInScreen(),
        //   "/sign-up": (context) => const SignUpScreen(),
        //   "/sign-up-upload": (context) => const SignUpUploadScreen(),
        //   "/sign-up-upload-idcard": (context) => const SignUpUploadIdcardScreen(),
        //   "/sign-up-success": (context) => const SignUpSuccess(),
        //   "/home": (context) => const HomeScreen(),
        //   "/profile": (context) => const ProfileScreen(),
        //   "/pin": (context) => const PinScreen(),
        //   "/profile-update": (context) => const ProfileUpdateScreen(),
        //   "/profile-update-pin": (context) => const ProfilePinUpdateScreen(),
        //   "/profile-update-success": (context) => const ProfileUpdateSuccess(),
        //   "/top-up": (context) => const TopUpScreen(),
        //   "/top-up-amount": (context) => const TopUpAmountScreen(),
        //   "/success": (context) => const SuccessScreen(),
        //   "/transfer": (context) => const TransferScreen(),
        //   "/transfer-amount": (context) => const TransferAmountScreen(),
        //   "/data-provider": (context) => const DataProviderScreen(),
        //   "/data-package": (context) => const DataPackageScreen()
        // },
      ),
    );
  }
}
