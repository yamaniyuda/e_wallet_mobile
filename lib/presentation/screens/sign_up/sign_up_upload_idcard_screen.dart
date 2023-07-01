import 'dart:convert';
import 'dart:io';

import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/data/payloads/sign_up_payload.dart';
import 'package:e_wallet_mobile/presentation/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/presentation/screens/screen.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpUploadIdCardScreen extends StatefulWidget {
  final SignUpPayload dataForm;
  const SignUpUploadIdCardScreen({
    Key? key,
    required this.dataForm
  }) : super(key: key);

  @override
  State<SignUpUploadIdCardScreen> createState() => _SignUpUploadIdCardScreenState();
}

class _SignUpUploadIdCardScreenState extends State<SignUpUploadIdCardScreen> {
  XFile? _image;

  bool _validate() {
    if (_image == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.of(context).pushReplacementNamed(
              RouteCollection.successScreen.name,
              arguments: SuccessScreenArguments(
                title: "Anda Berhasil \nTerdaftar",
                subTitle: "Grow your finance start \ntogether with us",
                buttonText: "Get Started"
              )
            );
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
              Container(
                height: 50,
                width: 155,
                margin: const EdgeInsets.only(top: 100, bottom: 100),
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/img_logo_white.png"))
                ),
              ),
              Text(
                "Verify Your \n Account",
                style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final image = await selectImage();
                        setState(() {
                          _image = image;
                        });
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightBackgroundColor,
                            image: _image == null
                                ? null
                                : DecorationImage(
                                image: FileImage(
                                    File(_image!.path)
                                )
                            )
                        ),
                        child: _image != null ? null : Center(
                          child: Image.asset("assets/icons/ic_upload.png", width: 32),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Passport/ID Card",
                      style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomFilledButton(
                      title: "Continue",
                      onPress: () {
                        if (_validate()) {
                          context.read<AuthBloc>().add(AuthRegister(widget.dataForm.copyWith(
                              ktp: _image == null
                                  ? null
                                  : "data:image/png;base64,${base64Encode(
                                  File(_image!.path).readAsBytesSync()
                              )}"
                          )));
                        } else {
                          showCustomSnackBar(context, "Gambar tidak boleh kosong.");
                        }
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 60),
              CustomTextButton(
                title: "Skip for Now",
                onPress: () {
                  context.read<AuthBloc>().add(AuthRegister(widget.dataForm.copyWith(
                    ktp: null
                  )));
                },
              )
            ],
          );
        },
      ),
    );
  }
}
