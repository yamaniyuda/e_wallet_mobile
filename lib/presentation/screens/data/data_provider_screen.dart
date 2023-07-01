import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/domain/entities/operator_card_entity.dart';
import 'package:e_wallet_mobile/presentation/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/presentation/blocs/operator_card/operator_card_bloc.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/presentation/widgets/buttons.dart';
import 'package:e_wallet_mobile/presentation/widgets/data_provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataProviderScreen extends StatefulWidget {
  const DataProviderScreen({Key? key}) : super(key: key);

  @override
  State<DataProviderScreen> createState() => _DataProviderScreenState();
}

class _DataProviderScreenState extends State<DataProviderScreen> {
  OperatorCardEntity? selectOperatorCardEntity;

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
                              selectOperatorCardEntity = e;
                            });
                          },
                          child: DataProviderItem(
                            operatorCardModel: e,
                            isSelected: e.id == selectOperatorCardEntity?.id
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
        floatingActionButton: selectOperatorCardEntity != null
            ? Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomFilledButton(
            title: "Continue",
            onPress: () => Navigator.pushNamed(
                context,
                RouteCollection.dataPackageScreen.name,
                arguments: selectOperatorCardEntity
            ),
          ),
        )
            : null
    );
  }
}