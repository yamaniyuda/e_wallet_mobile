part of 'route_controller.dart';

enum RouteCollection {
  splashScreen,
  onBoardingScreen,
  // pinScreen,
  // homeScreen,
  // amountScreen,
  signInScreen,
  signUpScreen,
  signUpUploadProfileScreen,
  signUpUploadIdCard,
  // profileScreen,
  // profileUpdateScreen,
  // profileUpdatePinScreen,
  // topUpScreen,
  // transferScreen,
  // dataProviderScreen,
  // dataPackage
}

extension RouteCollectionExtension on RouteCollection {
  Widget getScreen(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (this) {
      case RouteCollection.splashScreen:
        return screen.SplashScreen();
      case RouteCollection.onBoardingScreen:
        return screen.OnboardingScreen();
      case RouteCollection.signInScreen:
        return screen.SignInScreen();
      case RouteCollection.signUpScreen:
        return screen.SignUpScreen();
      case RouteCollection.signUpUploadProfileScreen:
        return screen.SignUpUploadProfileScreen(dataForm: arguments as AuthRegisterEntity);
      case RouteCollection.signUpUploadIdCard:
        return screen.SignUpUploadIdCardScreen(dataForm: arguments as AuthRegisterEntity);
    }
  }
}