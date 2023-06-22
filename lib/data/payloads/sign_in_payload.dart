class SignInPayload {
  final String? email;
  final String? password;

  SignInPayload({
    required this.email,
    required this.password
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password":  password
    };
  }

  SignInPayload copyWith({
    String? email,
    String? password
  }) {
    return SignInPayload(
      email: email ?? this.email,
      password: password ?? this.password
    );
  }
}