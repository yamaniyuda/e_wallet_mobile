part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

class TransactionGet extends TransactionEvent {}