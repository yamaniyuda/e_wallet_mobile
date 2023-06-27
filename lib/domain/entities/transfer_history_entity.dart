import 'package:equatable/equatable.dart';

class TransferHistoryEntity extends Equatable {
  late int? id;
  late String? name;
  late String? username;
  late String? verified;
  late String? profilePicture;

  TransferHistoryEntity({
    this.name,
    this.id,
    this.profilePicture,
    this.username,
    this.verified
  });

  @override
  List<Object?> get props => [
    id, name, username, verified, profilePicture
  ];

  TransferHistoryEntity copyWith({
    int? id,
    String? name,
    String? username,
    String? verified,
    String? profilePicture
  }) {
    return TransferHistoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      profilePicture: profilePicture ?? this.profilePicture,
      verified: verified ?? this.verified
    );
  }
}