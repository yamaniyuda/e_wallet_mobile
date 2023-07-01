import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/domain/entities/payment_method_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/payment_method/fetch_data_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodGet>(_paymentMethodGet);
  }

  Future<void> _paymentMethodGet(PaymentMethodGet event, Emitter emit) async {
    try {
      emit(PaymentMethodLoading());
      final paymentMethods = await FetchDataUseCase().call();
      emit(PaymentMethodSuccess(paymentMethods));
    } catch (e) {
      emit(PaymentMethodFailed(e.toString()));
    }
  }
}
