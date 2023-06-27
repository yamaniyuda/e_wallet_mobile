import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_transfer_payload.dart';
import 'package:e_wallet_mobile/domain/use_cases/transaction/transfer_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<TransferPost>(_transferPost);
  }

  Future<void> _transferPost(TransferPost event, Emitter emit) async {
    try {
      emit(TransferLoading());
      await TransferUseCase().call(event.data);
      emit(TransferSuccess());
    } catch (e) {
      emit(TransferFailed(e.toString()));
    }
  }
}
