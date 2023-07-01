import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_data_plan_payload.dart';
import 'package:e_wallet_mobile/domain/use_cases/transaction/data_plan_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'data_plan_event.dart';
part 'data_plan_state.dart';

class DataPlanBloc extends Bloc<DataPlanEvent, DataPlanState> {
  DataPlanBloc() : super(DataPlanInitial()) {
    on<DataPlanPost>(_dataPlanPost);
  }

  Future<void> _dataPlanPost(DataPlanPost event, Emitter emitter) async {
    try {
      emit(DataPlanLoading());
      final bool data = await DataPlanUseCase().call(event.data);
      emit(DataPlanSuccess());
    } catch (e) {
      emit(DataPlanFailed(e.toString()));
    }
  }
}
