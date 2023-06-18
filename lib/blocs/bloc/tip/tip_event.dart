part of 'tip_bloc.dart';

@immutable
abstract class TipEvent extends Equatable {
  const TipEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TipGet extends TipEvent {}