part of 'payment_method_bloc.dart';

@immutable
abstract class PaymentMethodEvent extends Equatable {
  const PaymentMethodEvent();

  @override
  List<Object?> get props => [];
}

class PaymentMethodGet extends PaymentMethodEvent {}