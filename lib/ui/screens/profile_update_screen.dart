import 'package:e_wallet_mobile/blocs/bloc/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/models/user_update_form_model.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      _userNameController.text = authState.user.username!;
      _fullNameController.text = authState.user.name!;
      _emailController.text = authState.user.email!;
      _passwordController.text = authState.user.password!;
    }
  }

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
                        title: "Username",
                        controller: _userNameController,
                      ),
                      const SizedBox(height: 16),
                      CustomFormsField(
                        title: "Full Name",
                        controller: _fullNameController,
                      ),
                      const SizedBox(height: 16),
                      // NOTE: PASSWORD INPUT
                      CustomFormsField(
                        title: "Email Address",
                        controller: _emailController,
                      ),
                      CustomFormsField(
                        title: "Password",
                        obscureText: true,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 30),
                      CustomFilledButton(
                        title: "Update Now",
                        onPress: () {
                          context.read<AuthBloc>().add(AuthUpdateUser(
                            UserUpdateFormModel(
                              password: _passwordController.text,
                              email: _emailController.text,
                              name: _fullNameController.text,
                              username: _userNameController.text
                            )
                          ));
                        },
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
