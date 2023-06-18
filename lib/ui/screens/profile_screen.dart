import 'package:e_wallet_mobile/blocs/bloc/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState  >(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthInitial) {
            Navigator.of(context).pushNamedAndRemoveUntil("/sign-in", (route) => false);
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
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                  decoration: BoxDecoration(
                      color: whiteColor, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: (state as AuthSuccess).user.profilePicture == null
                                        ? AssetImage("assets/images/img_profil.png")
                                        : NetworkImage(state.user.profilePicture!) as ImageProvider
                            )
                        ),
                        child: (state).user.verified == 1
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: whiteColor
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.check_circle,
                                    color: greenColor,
                                    size: 24,
                                  ),
                                ),
                              )
                          ) : null
                      ),
                      const SizedBox(height: 16),
                      Text(
                        (state as AuthSuccess).user.name.toString() ?? "yamani",
                        style:
                            blackTextStyle.copyWith(fontWeight: medium, fontSize: 18),
                      ),
                      const SizedBox(height: 40),
                      ProfileMenuItem(
                          iconUrl: "assets/icons/ic_user.png",
                          title: "Edit Profile",
                          onTap: () async {
                            if (await Navigator.pushNamed(context, "/pin") == true) {
                              Navigator.pushNamed(context, "/profile-update");
                            }
                          }),
                      ProfileMenuItem(
                          iconUrl: "assets/icons/ic_shield.png",
                          title: "My PIN",
                          onTap: () async {
                            if (await Navigator.pushNamed(context, "/pin") == true) {
                              Navigator.pushNamed(context, "/profile-update-pin");
                            }
                          }),
                      ProfileMenuItem(
                          iconUrl: "assets/icons/ic_credit_card.png",
                          title: "Wallet Settings",
                          onTap: () => Navigator.pushNamed(context, "/pin")),
                      ProfileMenuItem(
                          iconUrl: "assets/icons/ic_my_award.png",
                          title: "My Rewards"),
                      ProfileMenuItem(
                          iconUrl: "assets/icons/ic_sidebar.png",
                          title: "Help Center"),
                      ProfileMenuItem(
                          iconUrl: "assets/icons/ic_log-out.png",
                          title: "Log Out",
                          margin: EdgeInsets.zero,
                          onTap: () {
                            context.read<AuthBloc>().add(AuthLogout());
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 87),
                CustomTextButton(title: "Report a Problem")
              ],
            );
        },
      ),
    );
  }
}
