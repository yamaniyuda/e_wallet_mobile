part of 'payment_method_bloc.dart';

@immutable
abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object?> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodFailed extends PaymentMethodState {
  final String e;
  const PaymentMethodFailed(this.e);

  @override
  List<Object?> get props => [e];
}

class PaymentMethodSuccess extends PaymentMethodState {
  final List<PaymentMethodEntity> paymentMethods;
  const PaymentMethodSuccess(this.paymentMethods);

  @override
  List<Object?> get props => [paymentMethods];
}