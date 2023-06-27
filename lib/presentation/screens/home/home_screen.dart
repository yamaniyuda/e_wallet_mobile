import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/models/transfer_form_model.dart';
import 'package:e_wallet_mobile/presentation/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/presentation/blocs/tip/tip_bloc.dart';
import 'package:e_wallet_mobile/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:e_wallet_mobile/presentation/blocs/user/user_bloc.dart';
import 'package:e_wallet_mobile/presentation/screens/screen_entity.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/home_latest_transaction.dart';
import 'package:e_wallet_mobile/ui/widgets/home_service_items.dart';
import 'package:e_wallet_mobile/ui/widgets/home_tips_item.dart';
import 'package:e_wallet_mobile/ui/widgets/home_user_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget implements ScreenEntity {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  bool isGuard = false;
}

class _HomeScreenState extends State<HomeScreen> {
  late bool showLatestTransaction = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle:
              blueTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          unselectedLabelStyle:
              blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/fi_layers.png",
                  width: 20,
                  color: blueColor,
                ),
                label: "Overview"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/fi_file-text.png",
                  width: 20,
                ),
                label: "History"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/ic_trending_up.png",
                  width: 20,
                ),
                label: "Statistic"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/ic_gift.png",
                  width: 20,
                ),
                label: "Reward"),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: Image.asset(
          "assets/icons/fi_plus-circle.png",
          width: 24,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          _buildProfile(context),
          _buildWalletCard(),
          _buildLevel(),
          _buildServices(context),
          _buildLatestTransaction(),
          _buildSendAgain(),
          _buildTips()
        ],
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 40),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Howdy,",
                    style: grayTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    (state as AuthSuccess).user.name ?? "Yamani Yuda",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteCollection.profileScreen.name
                ),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                              (state as AuthSuccess).user.profilePicture == null
                                  ? AssetImage("assets/images/img_profil.png")
                                  : NetworkImage(state.user.profilePicture!)
                                      as ImageProvider)),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: whiteColor),
                      child: const Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          height: 220,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/card.png",
                ))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (state as AuthSuccess).user.name ?? "Yamani Yuda",
                style:
                    whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
              ),
              const SizedBox(height: 28),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "**** **** **** ${state.user.cardNumber!.substring(12, 16)}",
                  style: whiteTextStyle.copyWith(
                      fontSize: 18, fontWeight: medium, letterSpacing: 6),
                ),
              ),
              const SizedBox(height: 21),
              Text("Belence", style: whiteTextStyle),
              Text(formatCurrency(state.user.balance ?? 0),
                  style: whiteTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 24)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLevel() {
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Level 1",
                style: blackTextStyle.copyWith(fontWeight: medium),
              ),
              const Spacer(),
              Text(
                "50%",
                style: greenTextStyle.copyWith(fontWeight: semiBold),
              ),
              Text(
                " of ${formatCurrency(110000000)}",
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: const LinearProgressIndicator(
              value: 0.55,
              minHeight: 4,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBackgroundColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Do Something",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItems(
                  iconUrl: "assets/icons/ic_download.png",
                  title: "Top Up",
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteCollection.topUpScreen.name
                  )
              ),
              HomeServiceItems(
                  iconUrl: "assets/icons/ic_repeat.png",
                  title: "Send",
                  onTap: () => Navigator.pushNamed(context, RouteCollection.transferScreen.name)),
              HomeServiceItems(
                iconUrl: "assets/icons/ic_upload_.png",
                title: "Withdraw",
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const MoreDialog());
                },
              ),
              const HomeServiceItems(
                  iconUrl: "assets/icons/ic_grid.png", title: "More")
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLatestTransaction() {
    return BlocProvider(
      create: (context) => TransactionBloc()..add(GetTransactionHistoryEvent()),
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state is TransactionSuccess && state.transactions.isNotEmpty) {
            print(state.transactions);
            return Container(
              margin: const EdgeInsets.only(top: 39),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Latest Transaction",
                    style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 14),
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: whiteColor),
                    child: Column(
                      children: state.transactions
                          .map((transaction) =>
                          HomeLatestTransaction(transaction: transaction))
                          .toList(),
                    )
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildSendAgain() {
    return BlocProvider(
      create: (context) => UserBloc()..add(UserGetRecent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserSuccess && state.users.isNotEmpty) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Send Again",
                    style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(height: 14),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: state.users
                            .map((e) => GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed("/transfer-amount",
                                  arguments: TransferFormModel(
                                    sendTo: e.username,
                                  ));
                            },
                            child: HomeUserItems(user: e)))
                            .toList()),
                  )
                ],
              ),
            );
          }
          return Container();
        }
      ),
    );
  }

  Widget _buildTips() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Friendly Tips",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          BlocProvider(
            create: (context) => TipBloc()..add(TipGetEvent()),
            child: BlocBuilder<TipBloc, TipState>(
              builder: (context, state) {
                if  (state is TipSuccess) {
                  return  GridView.count(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    clipBehavior: Clip.hardEdge,
                    crossAxisSpacing: 17,
                    children: state.tips.map(
                        (tip) => HomeTipsItem(tip: tip)
                    ).toList()
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          )
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: const EdgeInsets.all(30),
        height: 335,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Do More With Us",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 13),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                childAspectRatio: 0.75,
                children: [
                  HomeServiceItems(
                      iconUrl: "assets/icons/ic_smartphone.png",
                      title: "Data",
                      onTap: () =>
                          Navigator.of(context).pushNamed("/data-provider")),
                  HomeServiceItems(
                      iconUrl: "assets/icons/ic_droplet.png", title: "Water"),
                  HomeServiceItems(
                      iconUrl: "assets/icons/ic_twitch.png", title: "Stream"),
                  HomeServiceItems(
                      iconUrl: "assets/icons/ic_tv.png", title: "Movie"),
                  HomeServiceItems(
                      iconUrl: "assets/icons/ic_coffee.png", title: "Food"),
                  HomeServiceItems(
                      iconUrl: "assets/icons/ic_globe.png", title: "Travel"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
