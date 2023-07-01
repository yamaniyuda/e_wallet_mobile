import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_top_up_payload.dart';
import 'package:e_wallet_mobile/presentation/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/presentation/blocs/top_up/top_up_bloc.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:flutter/material.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/presentation/widgets/buttons.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../success/success_screen.dart';

class TopUpAmountScreen extends StatefulWidget {
  final TransactionTopUpPayload payload;
  const TopUpAmountScreen({
    Key? key,
    required this.payload
  }) : super(key: key);

  @override
  State<TopUpAmountScreen> createState() => _TopUpAmountScreenState();
}

class _TopUpAmountScreenState extends State<TopUpAmountScreen> {

  final TextEditingController _controller = TextEditingController(text: "0");

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text;
      _controller.value = _controller.value.copyWith(
          text: NumberFormat.currency(
              locale: "id",
              decimalDigits: 0,
              symbol: ""
          ).format(int.parse(text.replaceAll(".", "")))
      );
    });
  }

  void _addAmount(String number) {
    if (_controller.text == "0") {
      setState(() {
        _controller.text = "";
      });
    }
    setState(() {
      _controller.text = _controller.text + number;
    });
  }

  void _deleteAmount() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
        if (_controller.text == "") {
          _controller.text = "0";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TopUpBloc(),
        child: BlocConsumer<TopUpBloc, TopUpState>(
          listener: (context, state) async {
            if (state is TopUpFailed) {
              showCustomSnackBar(context, state.e);
            }

            if (state is TopUpSuccess) {
              await launchUrl(Uri.parse(state.redirectUrl));

              context.read<AuthBloc>().add(AuthUpdateBalance(int.parse(_controller.text.replaceAll(".", ""))));

              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteCollection.successScreen.name,
                (route) => false,
                arguments: SuccessScreenArguments(
                  title: "Top Up \nWallet Berhasil",
                  subTitle: "Use the money wisely and \ngrow your finance",
                  buttonText: "Back to Home",
                )
              );
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    "Total Amount",
                    style: whiteTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 20
                    ),
                  ),
                ),
                const SizedBox(height: 67),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    textAlign: TextAlign.center ,
                    controller: _controller,
                    keyboardType: TextInputType.none,
                    cursorColor: grayColor,
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                    showCursor: false,
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                      prefixIcon: Text(
                        "Rp",
                        style: whiteTextStyle.copyWith(
                          fontSize: 36,
                          fontWeight: medium,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: grayColor
                          )
                      ),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: grayColor
                          )
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 66),
                GridView(
                  shrinkWrap: true,
                  physics:  const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 40
                  ),
                  children: [
                    CustomInputButton(title: "1", onTap: () => _addAmount("1"),),
                    CustomInputButton(title: "2", onTap: () => _addAmount("2"),),
                    CustomInputButton(title: "3", onTap: () => _addAmount("3"),),
                    CustomInputButton(title: "4", onTap: () => _addAmount("4"),),
                    CustomInputButton(title: "5", onTap: () => _addAmount("5"),),
                    CustomInputButton(title: "6", onTap: () => _addAmount("6"),),
                    CustomInputButton(title: "7", onTap: () => _addAmount("7"),),
                    CustomInputButton(title: "8", onTap: () => _addAmount("8"),),
                    CustomInputButton(title: "9", onTap: () => _addAmount("9"),),
                    const SizedBox(),
                    CustomInputButton(title: "0", onTap: () => _addAmount("0"),),
                    GestureDetector(
                      onTap: () => _deleteAmount(),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: numberBackgroundColor
                        ),
                        child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: whiteColor,
                              size: 24,
                            )
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                CustomFilledButton(
                  title: "Checkout Now",
                  onPress: () async {
                    if (await Navigator.pushNamed(context, RouteCollection.pinScreen.name) == true) {
                      final authState = context.read<AuthBloc>().state;
                      String pin = "";

                      if (authState is AuthSuccess) {
                        pin = authState.user.pin!;
                      }
                      context.read<TopUpBloc>().add(TopUpPost(widget.payload.copyWith(
                          pin: int.parse(pin),
                          amount: int.parse(_controller.text.replaceAll(".", ""))
                      )));
                    }
                  },
                ),
                const SizedBox(height: 25),
                const CustomTextButton(
                  title: "Term & Conditions",
                ),
                const SizedBox(height: 40),
              ],
            );
          },
        ),
      ),
    );
  }
}