import 'package:e_wallet_mobile/blocs/bloc/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/blocs/bloc/operator_card/operator_card_bloc.dart';
import 'package:e_wallet_mobile/models/operator_card_model.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile/ui/widgets/data_provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataProviderScreen extends StatefulWidget {
  const DataProviderScreen({Key? key}) : super(key: key);

  @override
  State<DataProviderScreen> createState() => _DataProviderScreenState();
}

class _DataProviderScreenState extends State<DataProviderScreen> {
  OperatorCardModel? selectOperatorCardModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Beli Data"     ,
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
                create: (context) => OperatorCardBloc()..add(OperatorCardGet()),
                child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
                  builder: (context, state) {
                    if  (state is OperatorCardSuccess) {
                      return Column(
                        children: state.operatorCards.map(
                          (e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectOperatorCardModel = e;
                                });
                              },
                              child: DataProviderItem(
                                  operatorCardModel: e,
                                  isSelected: e.id == selectOperatorCardModel?.id
                              )
                          )
                        ).toList()
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
      floatingActionButton: selectOperatorCardModel != null
        ? Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomFilledButton(
              title: "Continue",
              onPress: () => Navigator.pushNamed(
                  context,
                  "/data-package",
                  arguments: selectOperatorCardModel
              ),
            ),
        )
        : null
    );
  }
}
