import 'package:equatable/equatable.dart';

class TransactionTopUpEntity extends Equatable {
  late String? redirectUrl;
  late String? token;

  TransactionTopUpEntity({
    this.token,
    this.redirectUrl
  });

  @override
  List<Object?> get props => [redirectUrl, token];

  TransactionTopUpEntity copyWith({
    String? redirectUrl,
    String? token
  }) {
    return TransactionTopUpEntity(
      token: token ?? this.token,
      redirectUrl: redirectUrl ?? this.redirectUrl
    );
  }
}