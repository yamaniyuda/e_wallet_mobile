import 'package:e_wallet_mobile/data/payloads/sign_in_payload.dart';
import 'package:e_wallet_mobile/data/payloads/sign_up_payload.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_top_up_payload.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_transfer_payload.dart';
import 'package:e_wallet_mobile/domain/entities/auth_entity.dart';
import 'package:e_wallet_mobile/domain/entities/operator_card_entity.dart';
import 'package:e_wallet_mobile/presentation/screens/screen.dart' as screen;
import 'package:e_wallet_mobile/presentation/screens/success/success.dart';
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