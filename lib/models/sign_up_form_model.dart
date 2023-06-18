class SignUpFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  const SignUpFormModel({
    this.name,
    this.email,
    this.password,
    this.ktp,
    this.pin,
    this.profilePicture
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "pin": pin,
      "profile_picture": profilePicture,
      "ktp": ktp
    };
  }

  SignUpFormModel copyWith({
    final String? pin,
    final String? profilePicture,
    final String? ktp
  }) {
    return SignUpFormModel(
      name: name,
      email: email,
      password: password,
      pin: pin ?? this.pin,
      ktp: ktp ?? this.ktp,
      profilePicture: profilePicture ?? this.profilePicture
    );
  }
}