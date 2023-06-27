import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/models/transfer_form_model.dart';
import 'package:e_wallet_mobile/models/user_model.dart';
import 'package:e_wallet_mobile/presentation/blocs/user/user_bloc.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile/ui/widgets/forms.dart';
import 'package:e_wallet_mobile/ui/widgets/transfer_recent_user_items.dart';
import 'package:e_wallet_mobile/ui/widgets/transfer_result_user_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {

  final TextEditingController _searchController = TextEditingController(
      text: "");
  UserEntity? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userBloc = context.read<UserBloc>()
      ..add(UserGetRecent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transfer",
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
            "Search",
            style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 14),
          CustomFormsField(
            title: "by username",
            isShowTitle: false,
            controller: _searchController,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(UserGetByUsername(value));
              } else {
                setState(() {
                  selectedUser = null;
                });
                userBloc.add(UserGetRecent());
              }
              setState(() {

              });
            },
          ),
          _searchController.text.isEmpty
              ? _buildRecentUsers()
              : _buildResultUsers()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selectedUser != null ? Container(
        margin: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: "Continue",
          onPress: () {
            Navigator.pushNamed(
                context,
                RouteCollection.topUpAmountScreen.name,
                arguments: TransferFormModel(
                  sendTo: selectedUser!.username,
                )
            );
          },
        ),
      ) : null,
    );
  }

  Widget _buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search",
            style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 14),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Column(
                  children: state.users.map((e) {
                    return TransferRecentUserItems(user: e);
                  }).toList(),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildResultUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Result",
            style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: Align(
              alignment: Alignment.center,
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {

                  if (state is UserSuccess) {
                    return Wrap(
                        spacing: 17,
                        runSpacing: 17,
                        children: state.users.map((e) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedUser = e;
                                });
                              },
                              child: TransferResultUserItems(user: e, isSelected: e.id == selectedUser?.id)
                          );
                        }).toList()
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}