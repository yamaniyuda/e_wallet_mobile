part of 'transaction_bloc.dart';

/// abstract class
abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

/// get latest transaction
class GetTransactionHistoryEvent extends TransactionEvent {}