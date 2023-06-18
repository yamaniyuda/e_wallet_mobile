import 'dart:convert';
import 'dart:io';

import 'package:e_wallet_mobile/blocs/bloc/auth/auth_bloc.dart';
import 'package:e_wallet_mobile/models/sign_up_form_model.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpUploadIdcardScreen extends StatefulWidget {
  const SignUpUploadIdcardScreen({Key? key}) : super(key: key);

  @override
  State<SignUpUploadIdcardScreen> createState() => _SignUpUploadIdcardScreenState();
}

class _SignUpUploadIdcardScreenState extends State<SignUpUploadIdcardScreen> {

  XFile? _image;

  bool _validate() {
    if (_image == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as SignUpFormModel;

    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.of(context).pushReplacementNamed("/sign-up-success");
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
                            context.read<AuthBloc>().add(AuthRegister(args.copyWith(
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
                    context.read<AuthBloc>().add(AuthRegister(args.copyWith(
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
