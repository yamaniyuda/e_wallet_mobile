import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ProfileUpdateSuccess extends StatelessWidget {
  const ProfileUpdateSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            Text(
              "Nice Update",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold
              ),
            ),
            const SizedBox(height: 26),
            Text(
              "Your data is safe with \nour system",
              textAlign: TextAlign.center,
              style: grayTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            CustomFilledButton(
              title: "My Profile",
              width: 183,
              onPress: () => Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false),
            )
          ],
        ),
      ),
    );
  }
}
