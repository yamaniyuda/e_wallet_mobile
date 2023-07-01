import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/domain/entities/operator_card_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/operator_card/fetch_data_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'operator_card_event.dart';
part 'operator_card_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardGet>(_getOperatorCard);
  }

  Future<void> _getOperatorCard(OperatorCardGet event, Emitter emit) async {
    try {
      emit(OperatorCardLoading());
      final operatorCards = await FetchDataUseCase().call();
      emit(OperatorCardSuccess(operatorCards));
    } catch (e) {
      emit(OperatorCardFailed(e.toString()));
    }
  }
}
