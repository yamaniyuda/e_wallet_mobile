import 'package:e_wallet_mobile/domain/entities/auth_entity.dart';
import 'package:e_wallet_mobile/presentation/screens/screen.dart' as screen;
import 'package:flutter/material.dart';

part 'route_collection.dart';

class RouteController {
  static RouteCollection? getEnumFromName(String name) {
    try {
      return RouteCollection.values.firstWhere((element) {
        return element.toString().split(".")[1] == name;
      });
    } catch (_) {
      return null;
    }
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    try {
      if (getEnumFromName(settings.name!) == null) throw Error();

      final Widget result = getEnumFromName(settings.name!)!.getScreen(settings);
      return MaterialPageRoute(builder: (_) => result);
    } catch (_) {
      return MaterialPageRoute(
        builder: (_) => RouteCollection.onBoardingScreen.getScreen(settings)
      );
    }
  }
}