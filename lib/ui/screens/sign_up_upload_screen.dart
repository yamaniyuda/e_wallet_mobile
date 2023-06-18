import 'dart:convert';
import 'dart:io';

import 'package:e_wallet_mobile/models/sign_up_form_model.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpUploadScreen extends StatefulWidget {
  const SignUpUploadScreen({Key? key}) : super(key: key);

  @override
  State<SignUpUploadScreen> createState() => _SignUpUploadScreenState();
}

class _SignUpUploadScreenState extends State<SignUpUploadScreen> {

  final TextEditingController _pinController = TextEditingController(text: "");
  XFile? _image;

  bool _validate() {
    if (_pinController.text.length != 6 || _image == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SignUpFormModel;

    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
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
            "Join Us to Unlock \n Your Growth",
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
                  "Yamani Yuda",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium
                  ),
                ),
                const SizedBox(height: 30),
                CustomFormsField(
                  type: TextInputType.number,
                  title: "Set PIN (6 digit number)",
                  controller: _pinController,
                ),
                const SizedBox(height: 30),
                CustomFilledButton(
                  title: "Continue",
                  onPress: () {
                    if (_validate()) {
                      Navigator.pushNamed(
                        context,
                        "/sign-up-upload-idcard",
                        arguments: SignUpFormModel(
                          name: args.name,
                          password: args.password,
                          email: args.email,
                          pin: _pinController.text,
                          profilePicture: "data:image/png;base64,${base64Encode(File(_image!.path).readAsBytesSync())}"
                        )
                      );
                    } else {
                      showCustomSnackBar(context, "Isi semua field");
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
