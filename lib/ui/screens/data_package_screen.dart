import 'package:e_wallet_mobile/blocs/bloc/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/blocs/bloc/data_plan/data_plan_bloc.dart';
import 'package:e_wallet_mobile/models/data_plan_form_model.dart';
import 'package:e_wallet_mobile/models/data_plan_model.dart';
import 'package:e_wallet_mobile/models/operator_card_model.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/screens/success_screen.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile/ui/widgets/forms.dart';
import 'package:e_wallet_mobile/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPackageScreen extends StatefulWidget {
  const DataPackageScreen({Key? key}) : super(key: key);

  @override
  State<DataPackageScreen> createState() => _DataPackageScreenState();
}

class _DataPackageScreenState extends State<DataPackageScreen> {
  final _controller = TextEditingController();
  DataPlanModel? selectDataPlanModel;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as OperatorCardModel;

    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is DataPlanSuccess) {
            context.read<AuthBloc>().add(
                AuthUpdateBalance(
                    selectDataPlanModel!.price! * -1
                )
            );
            Navigator.of(context).pushNamedAndRemoveUntil(
                "/success",
                (route) => false,
                arguments: const SuccessScreenArguments(
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
                    children: args.dataPlans!.map(
                            (e) =>
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectDataPlanModel = e;
                                });
                              },
                              child: PackageItem(
                                dataPlanModel: e,
                                isSelected: e.id == selectDataPlanModel?.id,
                              ),
                            )
                    ).toList(),
                  ),
                ),
                const SizedBox(height: 85),
              ],
            ),
            floatingActionButton: (selectDataPlanModel != null &&
                _controller.text.isNotEmpty)
                ? Padding(
              padding: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: "Continue",
                onPress: () async {
                  if (await Navigator.pushNamed(context, "/pin") == true) {
                    final authState = context
                        .read<AuthBloc>()
                        .state;
                    String pin = "";

                    if (authState is AuthSuccess) {
                      pin = authState.user.pin!;
                    }

                    context.read<DataPlanBloc>().add(
                        DataPlanPost(
                            DataPlanFormModel(
                                dataPlanId: selectDataPlanModel!.id,
                                pin: pin,
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