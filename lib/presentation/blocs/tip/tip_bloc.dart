import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/domain/entities/tip_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/tip/get_tip_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'tip_event.dart';
part 'tip_state.dart';

class TipBloc extends Bloc<TipEvent, TipState> {
  TipBloc() : super(TipInitial()) {
    on<TipGetEvent>(_getTip);
  }

  Future<void> _getTip(TipGetEvent event, Emitter emit) async {
    try {
      emit(TipLoading());
      final tips = await GetTipUseCase().call();
      emit(TipSuccess(tips));
    } catch (e) {
      emit(TipFailed(e.toString()));
    }
  }
}
