part of 'transaction_bloc.dart';

/// abstract class
abstract class TransactionState extends Equatable {
  const TransactionState();
  @override
  List<Object?> get props => [];
}

/// for first init state
class TransactionInitial extends TransactionState {}

/// state when change
class TransactionLoading extends TransactionState {}

/// state for error handling
class TransactionFailed extends TransactionState {
  final String e;
  const TransactionFailed(this.e);

  @override
  List<Object?> get props => [e];
}

/// state when success
class TransactionSuccess extends TransactionState {
  final List<TransactionEntity> transactions;
  const TransactionSuccess(this.transactions);

  @override
  List<Object?> get props => [transactions];
}