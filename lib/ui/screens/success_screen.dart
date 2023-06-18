import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SuccessScreenArguments {
  final String title;
  final String subTitle;
  final String buttonText;

  const SuccessScreenArguments({
    required this.title,
    required this.subTitle,
    required this.buttonText
  });
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SuccessScreenArguments;

    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            Text(
              args.title,
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold
              ),
            ),
            const SizedBox(height: 26),
            Text(
              args.subTitle,
              textAlign: TextAlign.center,
              style: grayTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            CustomFilledButton(
              title: args.buttonText,
              width: 183,
              onPress: () => Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false)
            )
          ],
        ),
      ),
    );
  }
}
