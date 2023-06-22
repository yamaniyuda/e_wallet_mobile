import 'package:e_wallet_mobile/blocs/bloc/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/models/sign_in_form_model.dart';
import 'package:e_wallet_mobile/presentation/screens/screen_entity.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget implements ScreenEntity {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();

  @override
  bool isGuard = false;
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _validate() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, "/home", (route) => false);
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
              Container(
                height: 50,
                width: 155,
                margin: const EdgeInsets.only(top: 100, bottom: 100),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/img_logo_white.png"))
                ),
              ),
              Text(
                "Sign In & \nGrow Your Finance",
                style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold
                ),
              ),
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
                      title: "Email Address",
                      controller: _emailController,
                    ),
                    const SizedBox(height: 16),
                    // NOTE: PASSWORD INPUT
                    CustomFormsField(
                      title: "Password",
                      obscureText: true,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Passsword",
                        style: blueTextStyle,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomFilledButton(
                      title: "Sign In",
                      onPress: () {
                        if (_validate()) {
                          context.read<AuthBloc>().add(AuthLogin(SignInFormModel(
                              password: _passwordController.text,
                              email: _emailController.text
                          )));
                        } else {
                          showCustomSnackBar(context, "Semua field wajib diisi.");
                        }
                      }
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              CustomTextButton(
                title: "Create New Account",
                onPress: () {
                  Navigator.pushNamed(context, RouteCollection.signUpScreen.name);
                },
              )
            ],
          );
        },
      ),
    );
  }
}
