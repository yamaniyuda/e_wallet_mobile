part of 'route_controller.dart';

enum RouteCollection {
  splashScreen,
  onBoardingScreen,
  successScreen,
  pinScreen,
  homeScreen,
  // amountScreen,
  signInScreen,
  signUpScreen,
  signUpUploadProfileScreen,
  signUpUploadIdCard,
  profileScreen,
  // profileUpdateScreen,
  // profileUpdatePinScreen,
  topUpScreen,
  topUpAmountScreen,
  transferScreen,
  transferAmountScreen,
  // dataProviderScreen,
  // dataPackage
}

extension RouteCollectionExtension on RouteCollection {
  Widget getScreen(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (this) {
      case RouteCollection.splashScreen:
        return screen.SplashScreen();
      case RouteCollection.successScreen:
        return screen.SuccessScreen(args: arguments as SuccessScreenArguments);
      case RouteCollection.onBoardingScreen:
        return screen.OnboardingScreen();
      case RouteCollection.signInScreen:
        return screen.SignInScreen();
      case RouteCollection.signUpScreen:
        return screen.SignUpScreen();
      case RouteCollection.signUpUploadProfileScreen:
        return screen.SignUpUploadProfileScreen(dataForm: arguments as SignUpPayload);
      case RouteCollection.signUpUploadIdCard:
        return screen.SignUpUploadIdCardScreen(dataForm: arguments as SignUpPayload);
      case RouteCollection.homeScreen:
        return screen.HomeScreen();
      case RouteCollection.profileScreen:
        return const screen.ProfileScreen();
      case RouteCollection.topUpScreen:
        return const screen.TopUpScreen();
      case RouteCollection.topUpAmountScreen:
        return screen.TopUpAmountScreen(payload: arguments as TransactionTopUpPayload);
      case RouteCollection.pinScreen:
        return screen.PinScreen();
      case RouteCollection.transferScreen:
        return const screen.TransferScreen();
      case RouteCollection.transferAmountScreen:
        return screen.TransferAmountScreen(payload: arguments as TransactionTransferPayload);
    }
  }
}