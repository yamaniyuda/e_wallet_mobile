part of 'tip_bloc.dart';

/// abstract class
abstract class TipEvent extends Equatable {
  const TipEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/// Event for get tip data
class TipGetEvent extends TipEvent {}