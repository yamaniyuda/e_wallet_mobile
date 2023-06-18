class UserModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final int? verified;
  final String? profilePicture;
  final String? password;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;

  const UserModel({
    this.name,
    this.email,
    this.profilePicture,
    this.pin,
    this.password,
    this.username,
    this.id,
    this.token,
    this.balance,
    this.cardNumber,
    this.verified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"],
      profilePicture: json["profile_picture"],
      name: json["name"],
      pin: json["pin"],
      id: json["id"],
      balance: json["balance"],
      cardNumber: json["card_number"],
      token: json["token"],
      username: json["username"],
      verified: json["verified"],
    );
  }

  UserModel copyWith({
    String? username,
    String? name,
    String? password,
    String? email,
    String? pin,
    int? balance
  }) {
    return UserModel(
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