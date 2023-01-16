part of 'cart_bloc.dart';

/// [CartEvent] abstract class is used Event of bloc.
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

/// [CartProgress] abstract class is used Auth Event
class CartProgress extends CartEvent {
  const CartProgress();
}
