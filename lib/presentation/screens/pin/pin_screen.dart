import 'package:e_wallet_mobile/presentation/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/presentation/screens/screen_entity.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinScreen extends StatefulWidget implements ScreenEntity {
  PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();

  @override
  bool isGuard = false;
}

class _PinScreenState extends State<PinScreen> {

  final TextEditingController _controller = TextEditingController(text: "");
  late String pin = "";

  void _addPin(String number) {
    if (_controller.text.length < 6) {
      setState(() {
        _controller.text = _controller.text + number;
      });
    }

    if (_controller.text.length == 6) {
      if (_controller.text == pin) {
        Navigator.pop(context, true);
      } else {
        _controller.text = "";
        showCustomSnackBar(context, "PIN yang anda masukkan salah. Silahkan coba lagi.");
      }
    }
  }

  void _deletePin() {
    if (_controller.text.isNotEmpty) {
      _controller.text = _controller.text.substring(0, _controller.text.length - 1);
    }
  }

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if  (authState is AuthSuccess) {
      pin = authState.user.pin!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter Pin",
                style: whiteTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 20
                ),
              ),
              const SizedBox(height: 72),
              SizedBox(
                width: 200,
                child: TextFormField(
                  obscureText: true,
                  controller: _controller,
                  keyboardType: TextInputType.none,
                  cursorColor: grayColor,
                  style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                      letterSpacing: 16
                  ),
                  showCursor: false,
                  enableInteractiveSelection: false,
                  obscuringCharacter: "*",
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: grayColor
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
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
                  CustomInputButton(title: "1", onTap: () => _addPin("1"),),
                  CustomInputButton(title: "2", onTap: () => _addPin("2"),),
                  CustomInputButton(title: "3", onTap: () => _addPin("3"),),
                  CustomInputButton(title: "4", onTap: () => _addPin("4"),),
                  CustomInputButton(title: "5", onTap: () => _addPin("5"),),
                  CustomInputButton(title: "6", onTap: () => _addPin("6"),),
                  CustomInputButton(title: "7", onTap: () => _addPin("7"),),
                  CustomInputButton(title: "8", onTap: () => _addPin("8"),),
                  CustomInputButton(title: "9", onTap: () => _addPin("9"),),
                  const SizedBox(),
                  CustomInputButton(title: "0", onTap: () => _addPin("0"),),
                  GestureDetector(
                    onTap: () => _deletePin(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
