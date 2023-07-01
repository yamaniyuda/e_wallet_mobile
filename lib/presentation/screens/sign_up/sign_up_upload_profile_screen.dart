import 'dart:convert';
import 'dart:io';

import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/data/payloads/sign_up_payload.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/presentation/widgets/buttons.dart';
import 'package:e_wallet_mobile/presentation/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/entities/auth_entity.dart';
import '../screen_entity.dart';

class SignUpUploadProfileScreen extends StatefulWidget implements ScreenEntity {
  final SignUpPayload dataForm;

  SignUpUploadProfileScreen({
    Key? key,
    required this.dataForm
  }) : super(key: key);

  @override
  State<SignUpUploadProfileScreen> createState() => _SignUpUploadProfileScreenState();

  @override
  bool isGuard = false;
}

class _SignUpUploadProfileScreenState extends State<SignUpUploadProfileScreen> {

  final TextEditingController _pinController = TextEditingController(text: "");
  XFile? _image;
  
  @override
  void initState() {
    super.initState();
  }
  
  bool _validate() {
    if (_pinController.text.length != 6 || _image == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
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
            "Join Us to Unlock \nYour Growth",
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
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6)
                  ],
                ),
                const SizedBox(height: 30),
                CustomFilledButton(
                  title: "Continue",
                  onPress: () {
                    if (_validate()) {
                      Navigator.pushNamed(
                        context,
                        RouteCollection.signUpUploadIdCard.name,
                        arguments: SignUpPayload(
                          name: widget.dataForm.name,
                          password: widget.dataForm.password,
                          email: widget.dataForm.email,
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
