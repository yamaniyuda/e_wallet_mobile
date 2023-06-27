import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_top_up_payload.dart';
import 'package:e_wallet_mobile/domain/entities/payment_method_entity.dart';
import 'package:e_wallet_mobile/models/payment_method_model.dart';
import 'package:e_wallet_mobile/models/top_up_form_model.dart';
import 'package:e_wallet_mobile/presentation/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/presentation/blocs/payment_method/payment_method_bloc.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile/ui/widgets/top_up_bank_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  PaymentMethodEntity? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top Up",
          style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            "Wallet",
            style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Row(
                children: [
                  Image.asset(
                    "assets/images/img_wallet.png",
                    width: 80,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (state as AuthSuccess).user.cardNumber!.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} "),
                        style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        state.user.name!,
                        style: grayTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
          const SizedBox(height: 40),
          Text(
            "Select Bank",
            style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 14),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodSuccess) {
                  return Column(
                      children: state
                          .paymentMethods
                          .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPaymentMethod = e;
                          });
                        },
                        child: TopUpBankItem(
                          paymentMethodEntity: e,
                          date: "50 mins",
                          isSelected: e.id == selectedPaymentMethod?.id,
                        ),
                      ))
                          .toList()
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: (selectedPaymentMethod != null) ? Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomFilledButton(
          title: "Continue",
          onPress: () => Navigator.pushNamed(
            context,
            RouteCollection.topUpAmountScreen.name,
            arguments: TransactionTopUpPayload(
                paymentMethodCode: selectedPaymentMethod?.code
            )
          ),
        ),
      ) : Container(),
    );
  }
}