class UserUpdatePayload {
  late int? id;
  late String? name;
  late String? email;
  late String? username;
  late String? profilePicture;
  late String? ktp;
  late int? balance;
  late String? cardNumber;
  late String? pin;
  late String? token;
  late String? password;
  late int? tokenExpiresIn;
  late String? tokenType;
  late int? verified;

  UserUpdatePayload({
    this.email,
    this.name,
    this.id,
    this.password,
    this.username,
    this.profilePicture,
    this.balance,
    this.cardNumber,
    this.tokenExpiresIn,
    this.tokenType,
    this.ktp,
    this.token,
    this.pin,
    this.verified
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "username": username,
      "ktp": ktp
    };
  }

  UserUpdatePayload copyWith({
    int? id,
    String? name,
    String? email,
    String? username,
    String? profilePicture,
    String? ktp,
    int? balance,
    String? cardNumber,
    String? pin,
    String? password,
    String? token,
    int? tokenExpiresIn,
    String? tokenType,
  }) {
    return UserUpdatePayload(
        id: id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        pin: pin ?? this.pin,
        balance: balance ?? this.balance,
        verified: verified,
        profilePicture: profilePicture,
        token: token,
        cardNumber: cardNumber
    );
  }
}