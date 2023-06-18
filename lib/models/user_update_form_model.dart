class UserUpdateFormModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;

  const UserUpdateFormModel({
    this.username,
    this.password,
    this.email,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "name": name,
      "password": password
    };
  }
}