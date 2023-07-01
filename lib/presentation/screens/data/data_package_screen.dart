import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_data_plan_payload.dart';
import 'package:e_wallet_mobile/domain/entities/data_plan_entity.dart';
import 'package:e_wallet_mobile/domain/entities/operator_card_entity.dart';
import 'package:e_wallet_mobile/presentation/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/presentation/blocs/data_plan/data_plan_bloc.dart';
import 'package:e_wallet_mobile/presentation/screens/success/success.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/presentation/widgets/buttons.dart';
import 'package:e_wallet_mobile/presentation/widgets/forms.dart';
import 'package:e_wallet_mobile/presentation/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPackageScreen extends StatefulWidget {
  final OperatorCardEntity args;
  const DataPackageScreen({
    Key? key,
    required this.args
  }) : super(key: key);

  @override
  State<DataPackageScreen> createState() => _DataPackageScreenState();
}

class _DataPackageScreenState extends State<DataPackageScreen> {
  final _controller = TextEditingController();
  DataPlanEntity? selectDataPlanEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is DataPlanSuccess) {
            print(selectDataPlanEntity);
            context.read<AuthBloc>().add(
                AuthUpdateBalance(
                    selectDataPlanEntity!.price! * -1
                )
            );
            Navigator.of(context).pushNamedAndRemoveUntil(
                RouteCollection.successScreen.name,
                    (route) => false,
                arguments: SuccessScreenArguments(
                  title: "Berhasil Transfer",
                  subTitle: "Use the money wisely and \ngrow your finance",
                  buttonText: "Back to Home",
                )
            );
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Paket Data",
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
                  "Phone Number",
                  style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold
                  ),
                ),
                CustomFormsField(
                  title: "+628",
                  isShowTitle: false,
                  controller: _controller,
                ),
                const SizedBox(height: 40),
                Text(
                  "Select Package",
                  style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold
                  ),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisSpacing: 17,
                    mainAxisSpacing: 18,
                    children: widget.args.dataPlans!.map(
                            (e) =>
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  print(e);
                                  selectDataPlanEntity = e;
                                });
                              },
                              child: PackageItem(
                                dataPlanModel: e,
                                isSelected: e.id == selectDataPlanEntity?.id,
                              ),
                            )
                    ).toList(),
                  ),
                ),
                const SizedBox(height: 85),
              ],
            ),
            floatingActionButton: (selectDataPlanEntity != null &&
                _controller.text.isNotEmpty)
                ? Padding(
              padding: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: "Continue",
                onPress: () async {
                  if (await Navigator.pushNamed(context, RouteCollection.pinScreen.name) == true) {
                    final authState = context
                        .read<AuthBloc>()
                        .state;
                    String pin = "";

                    if (authState is AuthSuccess) {
                      pin = authState.user.pin!;
                    }

                    context.read<DataPlanBloc>().add(
                        DataPlanPost(
                            TransactionDataPlanPayload(
                              dataPlanId: selectDataPlanEntity!.id,
                              pin: int.parse(pin),
                              phoneNumber: _controller.text
                            )
                        )
                    );
                  }
                },
              ),
            ) : null,
          );
        },
      ),
    );
  }
}