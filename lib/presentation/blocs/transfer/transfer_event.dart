part of 'transfer_bloc.dart';

@immutable
abstract class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object?> get props => [];
}

class TransferPost extends TransferEvent {
  final TransactionTransferPayload data;
  const TransferPost(this.data);

  @override
  List<Object?> get props => [data];
}

