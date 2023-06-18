import 'package:e_wallet_mobile/blocs/bloc/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePinUpdateScreen extends StatefulWidget {
  const ProfilePinUpdateScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePinUpdateScreen> createState() => _ProfilePinUpdateScreenState();
}

class _ProfilePinUpdateScreenState extends State<ProfilePinUpdateScreen> {
  final TextEditingController _oldPinController = TextEditingController();
  final TextEditingController _newPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Photo",
          style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 20
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamed(context, "/profile-update-success");
          }
        },
        builder: (context, state) {

          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NOTE: EMAIL INPUT
                    CustomFormsField(
                      title: "Old Pin",
                      controller: _oldPinController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormsField(
                      title: "New Pin",
                      controller: _newPinController,
                    ),
                    const SizedBox(height: 30),
                    CustomFilledButton(
                      title: "Update Now",
                      onPress: () {
                        context.read<AuthBloc>().add(AuthUpdatePin(
                          oldPin: _oldPinController.text,
                          newPin: _newPinController.text
                        ));
                      }
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
