import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            Text(
              "Akun Berhasil \n Terdaftar",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold
              ),
            ),
            const SizedBox(height: 26),
            Text(
              "Grow your finance start \n together with us",
              textAlign: TextAlign.center,
              style: grayTextStyle.copyWith(
                  fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            CustomFilledButton(
              title: "Get Started",
              width: 183,
              onPress: () => Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false),
            )
          ],
        ),
      ),
    );
  }
}
